# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::BoundingBox, :vcr do
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
    expect(product.bounding_box).to be_a(described_class)
    expect(product.bounding_box.max).to be_a(Ioki::Model::Passenger::Coordinate)
    expect(product.bounding_box.max.lat).to be_a(Float)
    expect(product.bounding_box.max.lng).to be_a(Float)
    expect(product.bounding_box.min).to be_a(Ioki::Model::Passenger::Coordinate)
    expect(product.bounding_box.min.lat).to be_a(Float)
    expect(product.bounding_box.min.lng).to be_a(Float)
  end
end
