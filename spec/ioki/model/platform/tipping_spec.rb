# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::Tipping, :vcr do
  setup_platform_client(:platform_client)
  setup_passenger_client(:passenger_client)

  let(:product) { platform_client.products.first }
  let(:tipping) { product.tipping }

  it 'has data for all defined attributes' do
    expect(tipping).to be_a(described_class)
    expect(tipping.maximum).to be_a(Ioki::Model::Platform::Money)
    expect(tipping.minimum).to be_a(Ioki::Model::Platform::Money)
    expect(tipping.suggestions).to be_a(Array)
    expect(tipping.suggestions).to all(be_a(Ioki::Model::Platform::Money))
  end
end
