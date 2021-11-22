# frozen_string_literal: true

require 'securerandom'

RSpec.describe 'Booking and cancelling a ride via the passenger_api', :vcr do
  # Compare fixtures/vcr_cassettes for the recorded requests and responses for this example.

  setup_platform_client(:platform_client)
  setup_passenger_client(:passenger_client)

  it 'allows to finish the user flow' do
    provider_id = platform_client.providers.first.id
    user_id = platform_client.create_user(
      provider_id,
      Ioki::Model::Platform::User.new(
        first_name:     'Mose',
        last_name:      'Kiszka',
        external_id:    SecureRandom.uuid,
        terms_accepted: true
      )
    ).id

    request_token = platform_client.create_request_token(
      provider_id,
      user_id,
      Ioki::Model::Platform::PassengerRequestToken.new(
        client_identifier: 'dev.passengerapi.test.backend'
      )
    )
    product_id = platform_client.products.first.id

    passenger_client.config.api_token = request_token.token

    station1 = platform_client.stations(product_id).first
    station2 = platform_client.stations(product_id).last

    new_ride = Ioki::Model::Passenger::Ride.new(
      product_id:  product_id,
      origin:      {
        lat:  station1.lat,
        lng:  station1.lng,
        time: Time.at(Time.now.to_i + 7200).to_s
      },
      destination: {
        lat: station2.lat,
        lng: station2.lng
      },
      passengers:  Ioki::Model::Passenger::RidePassenger.new(type: 'adult')
    )

    created_ride = passenger_client.create_ride(new_ride)

    5.times do
      break if created_ride.state == 'ready'

      sleep 1
      created_ride = passenger_client.ride(created_ride.id)
    end

    raise created_ride.state.to_s unless created_ride.state == 'ready'

    booking = Ioki::Model::Passenger::Booking.new(
      ride_version:   created_ride.version.to_i,
      payment_method: { payment_method_type: 'cash' }
    )

    created_booking = passenger_client.create_booking(created_ride.id, booking)

    expect(created_booking.verification_code).not_to be_nil

    created_ride = passenger_client.ride(created_ride.id)

    cancelled_ride = passenger_client.create_cancellation(
      created_ride.id,
      Ioki::Model::Passenger::Cancellation.new(
        ride_version:        created_ride.version.to_i,
        cancellation_reason: 'I found something better'
      )
    )

    expect(cancelled_ride.state).to eq 'cancelled'
  end
end
