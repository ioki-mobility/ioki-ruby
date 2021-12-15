# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::RideOptions, :vcr do
  setup_platform_client(:platform_client)
  let(:product) { platform_client.products.first }

  it 'has data for all defined attributes' do
    expect(product.ride_options).to be_a(described_class)
    expect(product.ride_options.book_for_others).to be(true).or(be(false))
    expect(product.ride_options.destination_time_based_matching).to be(true).or(be(false))
    expect(product.ride_options.max_wheelchairs).to be_a(Integer)
    expect(product.ride_options.max_walkers).to be_a(Integer)
    expect(product.ride_options.passengers).to be_a(Ioki::Model::Platform::PassengerOptions)
    expect(product.ride_options.passengers.types.first).to be_a(Ioki::Model::Platform::PassengerType)
    expect(product.ride_options.prebooking_threshold).to be_a(Ioki::Model::Platform::PrebookingThreshold)
  end
end
