# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::RideOptions, :vcr do
  setup_platform_client(:platform_client)
  setup_passenger_client(:passenger_client)

  let(:product) { passenger_client.products.first }

  before do
    passenger_client.config.api_token = platform_client.create_request_token(
      platform_client.providers.first,
      platform_client.users(platform_client.providers.first).last,
      Ioki::Model::Platform::PassengerRequestToken.new(
        client_identifier: 'dev.passengerapi.test.backend'
      )
    ).token
  end

  it 'has data for all defined attributes' do
    expect(product.ride_options).to be_a(described_class)
    expect(product.ride_options.book_for_others).to be(true).or(be(false))
    expect(product.ride_options.destination_time_based_matching).to be(true).or(be(false))
    expect(product.ride_options.max_wheelchairs).to be_a(Integer)
    expect(product.ride_options.max_walkers).to be_a(Integer)
    expect(product.ride_options.passengers).to be_a(Ioki::Model::Passenger::PassengerOptions)
    expect(product.ride_options.passengers.types.first).to be_a(Ioki::Model::Passenger::PassengerType)
    expect(product.ride_options.prebooking_threshold).to be_a(Ioki::Model::Passenger::PrebookingThreshold)
  end
end
