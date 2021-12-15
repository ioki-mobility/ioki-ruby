# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::ServiceCreditOptions, :vcr do
  setup_platform_client(:platform_client)
  let(:provider) { platform_client.providers.first }

  it 'has data for all defined attributes' do
    expect(provider.service_credit_options).to be_a(described_class)
    pending('Missing data on demo product')
    expect(provider.service_credit_options.packages.first).to be_a(Ioki::Model::Platform::Package)
  end
end
