# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::GeoJson, :vcr do
  setup_platform_client(:platform_client)
  let(:product) { platform_client.products.first }

  it 'has data for all defined attributes' do
    expect(product.area).to be_a(described_class)
    expect(product.area.coordinates).to be_a(Array)
    expect(product.area.coordinates.flatten(3)).to all(be_a(Float))
  end
end
