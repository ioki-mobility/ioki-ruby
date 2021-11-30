# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Create, book and confirm a ride with the platform API', :vcr do
  # Compare fixtures/vcr_cassettes for the recorded requests and responses for this example.

  setup_platform_client(:platform_client)

  it 'is possible' do
    provider = platform_client.providers.first
    product = platform_client.products(provider).first
    user = platform_client.users(provider).reject(&:locked_at).last

    sta_1 = platform_client.stations(product).first
    sta_2 = platform_client.stations(product).last

    ride = Ioki::Model::Platform::Ride.new(
      {
        origin:         { lat: sta_1.lat, lng: sta_1.lng, time: Time.at(Time.now.to_i + 7200).to_s },
        destination:    { lat: sta_2.lat, lng: sta_2.lng },
        user_id:        user.id,
        passengers:     [{ type: 'adult' }],
        storage_spaces: 0
      }
    )

    new_ride = platform_client.create_ride(product, ride)
    reloaded_ride = nil

    60.times do
      # waiting for a match for the requested ride

      reloaded_ride = platform_client.ride('prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556', new_ride)

      break if reloaded_ride.state != 'searching'

      sleep 1
    end

    expect(reloaded_ride.state).to eq 'ready'

    booking = Ioki::Model::Platform::Booking.new(
      ride_version:   reloaded_ride.version,
      payment_method: { payment_method_type: 'cash' }
    )

    platform_client.create_booking('prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556', reloaded_ride, booking)
    booked_ride = platform_client.ride('prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556', new_ride)

    confirmed_ride = nil

    60.times do
      # Waiting for driver to confirm the ride.

      confirmed_ride = platform_client.ride('prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556', new_ride)

      break if confirmed_ride.state != 'passenger_accepted'

      sleep 1
    end

    # The booking was confirmed:
    expect(confirmed_ride.state).to eq 'driver_accepted'
    expect(confirmed_ride.version).to eq 6
    expect(booked_ride.booking.verification_code).not_to be_empty

    # Pickup information is available:

    expect(booked_ride.pickup.lat).not_to be_nil
    expect(booked_ride.pickup.lng).not_to be_nil
    expect(booked_ride.pickup.station_id).not_to be_empty

    # Dropoff information is available:

    expect(booked_ride.dropoff.lat).not_to be_nil
    expect(booked_ride.dropoff.lng).not_to be_nil
    expect(booked_ride.dropoff.station_id).not_to be_empty
  end
end
