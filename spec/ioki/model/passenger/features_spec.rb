# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::Features, :vcr do
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
    features = passenger_client.bootstrap.client.features

    expect(features).to be_a(described_class)
    expect(features.analytics_tracking).to be(true).or(be(false))
    expect(features.failed_payment_handling).to be(true).or(be(false))
    expect(features.marketing_automation).to be(true).or(be(false))
  end
end
