# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::ImageVersion, :vcr do
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
    pending('Needs a product with an avatar')

    expect(product.avatar).to be_a(Ioki::Model::Passenger::ImageUpload)
    expect(product.avatar.versions.first).to be_a(described_class)
    expect(product.avatar.versions.first.large).to be_a(String)
    expect(product.avatar.versions.first.medium).to be_a(String)
    expect(product.avatar.versions.first.small).to be_a(String)
    expect(product.avatar.versions.first.mini).to be_a(String)
  end
end
