# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::Features, :vcr do
  setup_platform_client(:platform_client)
  let(:features) { platform_client.providers.first.features }

  it 'has data for all defined attributes' do
    expect(features).to be_a(described_class)
    expect(features.failed_payment_handling).to be(true).or(be(false))
    expect(features.payment).to be(true).or(be(false))
  end
end
