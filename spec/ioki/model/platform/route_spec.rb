# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::Route, :vcr do
  setup_platform_client(:platform_client)
  let(:product) { platform_client.products.first }

  it 'has data for all defined attributes' do
    expect(platform_client.rides(product).first.route).to be_a(described_class)
    expect(platform_client.rides(product).first.route.track).to be_a(String)
  end
end
