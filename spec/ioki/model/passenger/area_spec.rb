# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::Area, :vcr do
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
    expect(product.area).to be_a(described_class)
    expect(product.area.coordinates).to be_a(Array)
    expect(product.area.coordinates.flatten(3)).to all(be_a(Float))
  end
end
