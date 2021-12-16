# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::Timezone, :vcr do
  let(:product) { passenger_client.products.first }

  setup_platform_client(:platform_client)
  setup_passenger_client(:passenger_client)

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
    expect(product.timezone).to be_a(described_class)
    expect(product.timezone.utc_offset).to be_a(Integer)
    expect(product.timezone.identifier).to be_a(String)
  end
end
