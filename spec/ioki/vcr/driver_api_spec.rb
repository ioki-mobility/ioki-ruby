# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Ioki::DriverApi', :vcr do
  setup_platform_client(:platform_client)
  setup_driver_client(:driver_client)

  let(:real_demo_product_id) { platform_client.products.first.id }
  let(:new_driver) do
    Ioki::Model::Platform::Driver.new(
      first_name: 'Brook',
      last_name:  'Harbinson',
      username:   'brook_harbinson'
    )
  end

  describe 'getting the product' do
    it 'returns the current product' do
      created_driver = platform_client.create_driver(real_demo_product_id, new_driver)
      platform_client.drivers_set_pin(real_demo_product_id, created_driver.id, body: { data: { pin: '123456' } })

      driver_client.config.api_token = driver_client.create_request_token(
        Ioki::Model::Driver::DriverRequestToken.new(username: 'brook_harbinson', pin: '123456')
      ).token

      product = driver_client.product
      expect(product).to be_a(Ioki::Model::Driver::Product)
      expect(product.name).to eq 'Webbooking Test Product'

      platform_client.delete_driver(real_demo_product_id, created_driver)
    end
  end
end
