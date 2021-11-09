# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Ioki::PlatformApi', :vcr do
  # Compare fixtures/vcr_cassettes for the recorded requests and responses for this example.

  setup_platform_client(:platform_client)

  describe 'driver_endpoint' do
    let(:real_demo_product_id) { platform_client.products.first.id }
    let(:new_driver) do
      Ioki::Model::Platform::Driver.new(first_name: 'Suzie', last_name: 'Sabastian', username: 'vcr-suszab')
    end

    it 'allows to create and delete a driver' do
      created_driver = platform_client.create_driver(real_demo_product_id, new_driver)
      expect(platform_client.drivers(real_demo_product_id).map(&:username)).to include 'vcr-suszab'

      platform_client.delete_driver(real_demo_product_id, created_driver)
      expect(platform_client.drivers(real_demo_product_id).map(&:username)).not_to include 'vcr-suszab'
    end
  end
end
