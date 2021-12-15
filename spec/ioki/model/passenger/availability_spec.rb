# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::Availability, :vcr do
  setup_platform_client(:platform_client)
  setup_passenger_client(:passenger_client)
  let(:product) { passenger_client.products.first }
  let(:ride_inqury) do
    Ioki::Model::Passenger::RideInquiry.new(
      origin:      { lat: 1, lng: 1 },
      destination: { lat: 1, lng: 1 },
      product_id:  product.id
    )
  end

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
    returned_ride_inquiry = passenger_client.create_ride_inquiry(ride_inqury)
    expect(returned_ride_inquiry.availability).to be_a(described_class)
  end
end
