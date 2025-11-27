# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Ioki::PlatformApi', :vcr do
  # Compare fixtures/vcr_cassettes for the recorded requests and responses for this example.

  setup_platform_client(:platform_client)
  let(:real_demo_product_id) { platform_client.products.first.id }
  let(:real_demo_provider_id) { platform_client.providers.first.id }

  describe 'driver_endpoint' do
    let(:new_driver) do
      Ioki::Model::Platform::Driver.new(first_name: 'Suzie', last_name: 'Sabastian', username: 'vcr-suszab')
    end

    it 'allows to create and delete a driver' do
      created_driver = platform_client.create_driver(real_demo_product_id, new_driver)
      expect(platform_client.drivers(real_demo_product_id).map(&:username)).to include 'vcr-suszab'

      platform_client.delete_driver(real_demo_product_id, created_driver.id)
      expect(platform_client.drivers(real_demo_product_id).map(&:username)).not_to include 'vcr-suszab'
    end
  end

  describe 'an object endpoint without a model class' do
    it 'is returned as a hash' do
      expect(platform_client.rides(real_demo_product_id).first.fare.fare_details).to be_a(Hash)
    end
  end

  describe 'index endpoints' do
    let(:task_list_id) do
      platform_client.task_lists(real_demo_product_id, params: { per_page: 1, page: 1 }).first.id
    end
    let(:station_id) do
      platform_client.stations(real_demo_product_id, params: { page: 2 })
        .find { |station| station.location_name == 'Deaktivierungstest' }
        .id
    end

    it 'return their corresponding models' do
      expect(platform_client.stations(real_demo_product_id).first).to be_a(Ioki::Model::Platform::Station)
      expect(platform_client.vehicles(real_demo_product_id).first).to be_a(Ioki::Model::Platform::Vehicle)
      expect(platform_client.rides(real_demo_product_id).first).to be_a(Ioki::Model::Platform::Ride)
      expect(platform_client.users(real_demo_provider_id).first).to be_a(Ioki::Model::Platform::User)
      expect(platform_client.drivers(real_demo_product_id).first).to be_a(Ioki::Model::Platform::Driver)
      expect(platform_client.driver_vehicle_connections(real_demo_product_id).first)
        .to be_a(Ioki::Model::Platform::DriverVehicleConnection)
      expect(platform_client.client).to be_a(Ioki::Model::Platform::Client)
      expect(platform_client.providers.first).to be_a(Ioki::Model::Platform::Provider)
      expect(platform_client.products.first).to be_a(Ioki::Model::Platform::Product)
      expect(platform_client.station_deactivations(real_demo_product_id, station_id).first)
        .to be_a(Ioki::Model::Platform::Deactivation)
      expect(platform_client.task_lists(real_demo_product_id).first).to be_a(Ioki::Model::Platform::TaskList)
      expect(platform_client.tasks(real_demo_product_id, task_list_id).first).to be_a(Ioki::Model::Platform::Task)

      # expect(platform_client.pauses(real_demo_product_id, task_list_id).first).to be_a(Ioki::Model::Platform::Pause)
      # No task-list-pause defined on the test platform. How can I get one?

      # expect(platform_client.task_list_deactivations(real_demo_product_id, task_list_id).first).
      # to be_a(Ioki::Model::Platform::Deactivation)
      # Don't know how to deactivate task lists yet.

      # expect(platform_client.driver_emergencies(real_demo_product_id).first).
      # to be_a(Ioki::Model::Platform::DriverEmergency)
      # feature_not_available. Couldn't find out how to activate it in the test product

      # expect(platform_client.receipts(real_demo_provider_id).first).to be_a(Ioki::Model::Platform::Receipt)
      # No receipt defined on the test platform. How can I get one?

      expect(platform_client.current_journey(real_demo_product_id, task_list_id))
        .to be_a(Ioki::Model::Platform::Journey)
      # Has no data here

      # user_id = platform_client.users(real_demo_provider_id).first.id
      # expect(platform_client.service_credits(real_demo_provider_id, user_id).first).
      # to be_a(Ioki::Model::Platform::ServiceCredit)
      # No service_credits found for user

      # expect(platform_client.webhooks(real_demo_provider_id).first).to be_a(Ioki::Model::Platform::Webhook)
      # No webhook defined on demo product
    end
  end

  describe 'show endpoints' do
    it 'return their corresponding models' do
      expect(platform_client.client).to be_a(Ioki::Model::Platform::Client)
    end
  end
end
