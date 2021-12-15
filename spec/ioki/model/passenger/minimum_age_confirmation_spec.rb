# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::MinimumAgeConfirmation, :vcr do
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

    pending('Needs a client with a minimum_age_confirmation feature enabled')
    expect(features.minimum_age_confirmation).to be_a(described_class)
    expect(features.minimum_age_confirmation.minimum_age).to be_a(Integer)
    expect(features.newsletter).to be(true).or(be(false))
    expect(features.non_purchasable_personal_discounts).to be(true).or(be(false))
    expect(features.payment).to be(true).or(be(false))
    expect(features.promo_codes).to be(true).or(be(false))
    expect(features.purchasable_personal_discounts).to be(true).or(be(false))
    expect(features.referrals).to be(true).or(be(false))
    expect(features.service_credits).to be(true).or(be(false))
    expect(features.unique_customer_id).to be(true).or(be(false))
    expect(features.user_email_required).to be(true).or(be(false))
  end
end
