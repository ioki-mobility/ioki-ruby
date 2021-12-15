# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::BoundingBox, :vcr do
  setup_platform_client(:platform_client)
  let(:product) { platform_client.products.first }

  it 'has data for all defined attributes' do
    expect(product.bounding_box).to be_a(described_class)
    expect(product.bounding_box.max).to be_a(Ioki::Model::Platform::Coordinate)
    expect(product.bounding_box.max.lat).to be_a(Float)
    expect(product.bounding_box.max.lng).to be_a(Float)
    expect(product.bounding_box.min).to be_a(Ioki::Model::Platform::Coordinate)
    expect(product.bounding_box.min.lat).to be_a(Float)
    expect(product.bounding_box.min.lng).to be_a(Float)
  end
end
