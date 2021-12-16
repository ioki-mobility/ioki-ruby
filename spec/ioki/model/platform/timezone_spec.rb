# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::Timezone, :vcr do
  setup_platform_client(:platform_client)
  let(:product) { platform_client.products.first }

  it 'has data for all defined attributes' do
    expect(product.timezone).to be_a(described_class)
    expect(product.timezone.utc_offset).to be_a(Integer)
    expect(product.timezone.identifier).to be_a(String)
  end
end
