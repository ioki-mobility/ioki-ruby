# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::Availability, :vcr do
  setup_platform_client(:platform_client)
  let(:product) { platform_client.products.first }
  let(:ride_inqury) do
    Ioki::Model::Platform::RideInquiry.new(origin: { lat: 1, lng: 1 }, destination: { lat: 1, lng: 1 })
  end

  it 'has data for all defined attributes' do
    returned_ride_inquiry = platform_client.create_ride_inquiry(product, ride_inqury)
    expect(returned_ride_inquiry.availability).to be_a(described_class)
  end
end
