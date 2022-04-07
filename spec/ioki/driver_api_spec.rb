# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::DriverApi do
  let(:driver_client) do
    Ioki::Client.new(
      instance_double(
        Ioki::Configuration,
        :config,
        api_base_url:          'https://app.io.ki/api',
        api_version:           '1',
        api_client_identifier: 'ID',
        api_client_secret:     'SECRET',
        api_client_version:    'VERSION',
        api_token:             'TOKEN',
        language:              'de'
      ),
      described_class
    )
  end
  let(:result_with_data) { instance_double(Hash, 'result double with data', '[]' => {}) }
  let(:result_with_index_data) { instance_double(Hash, 'result double with data', '[]' => [{}]) }
  let(:full_response) { instance_double(Faraday::Response, 'full_response', headers: {}) }
  let(:options) { { options: :example } }

  describe '#create_request_token' do
    let(:request_token) { Ioki::Model::Driver::DriverRequestToken.new }

    it 'calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/request_tokens')
        [result_with_data, full_response]
      end

      expect(driver_client.create_request_token(request_token, options)).
        to be_a(Ioki::Model::Driver::DriverRequestToken)
    end
  end

  describe '#product' do
    it 'calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/product')
        [result_with_data, full_response]
      end

      expect(driver_client.product(options)).to be_a(Ioki::Model::Driver::Product)
    end
  end

  describe '#driver' do
    it 'calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/driver')
        [result_with_data, full_response]
      end

      expect(driver_client.driver(options)).to be_a(Ioki::Model::Driver::Driver)
    end
  end

  describe 'vehicle' do
    let(:vehicle) { Ioki::Model::Driver::Task.new id: 'veh_123' }

    it '#vehicle calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/vehicle')
        [result_with_data, full_response]
      end

      expect(driver_client.vehicle(options)).to be_a(Ioki::Model::Driver::Vehicle)
    end

    it '#vehicle_pause calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/vehicle/pause')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(driver_client.vehicle_pause).to be_a(Ioki::Model::Driver::Vehicle)
    end

    it '#vehicle_unpause calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/vehicle/pause')
        expect(params[:method]).to eq(:delete)
        [result_with_data, full_response]
      end

      expect(driver_client.vehicle_unpause).to be_a(Ioki::Model::Driver::Vehicle)
    end
  end

  describe 'vehicle_connection' do
    let(:vehicle_connection) { Ioki::Model::Driver::VehicleConnection.new license_plate: '123' }

    it '#create_vehicle_connection calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/vehicle_connection')
        expect(params[:method]).to eq(:post)
        expect(params[:body]).to eq(data: { license_plate: '123' })
        [nil, full_response]
      end

      driver_client.create_vehicle_connection(vehicle_connection, options)
    end

    it '#delete_vehicle_connection calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/vehicle_connection')
        expect(params[:method]).to eq(:delete)
        expect(params[:body]).to eq(data: { license_plate: '123' })
        [{}, full_response]
      end

      driver_client.delete_vehicle_connection(vehicle_connection, options)
    end
  end

  describe 'vehicle_position' do
    let(:vehicle_position) do
      Ioki::Model::Driver::VehiclePosition.new lat: 1.0, lng: 2.0, recorded_at: '2012-12-12T12:12:12Z'
    end

    it '#vehicle_position calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/vehicle/positions')
        expect(params[:method]).to eq(:post)
        expect(params[:body]).to include(data: hash_including(lat: 1.0, lng: 2.0, recorded_at: be_a(DateTime)))
        [nil, full_response]
      end

      driver_client.vehicle_position(vehicle_position, options)
    end
  end

  describe 'tasks' do
    let(:task) { Ioki::Model::Driver::Task.new id: 'xyz_123' }

    it '#tasks calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/vehicle/tasks')
        [{ 'data' => [{ id: 'xyz_123' }] }, full_response]
      end
      expect(driver_client.tasks).to all(be_a(Ioki::Model::Driver::Task))
    end

    it '#task_confirmation calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/tasks/xyz_123/confirmation')
        expect(params[:method]).to eq(:post)
        [{ 'data' => { id: 'abc_123' } }, full_response]
      end
      expect(driver_client.task_confirmation(task)).to be_a(Ioki::Model::Driver::Ride)
    end

    it '#task_rejection calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/tasks/xyz_123/rejection')
        expect(params[:method]).to eq(:post)
        [{ 'data' => { id: 'abc_123' } }, full_response]
      end
      expect(driver_client.task_rejection(task)).to be_a(Ioki::Model::Driver::Ride)
    end

    it '#task_cancellation calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/tasks/xyz_123/cancellation')
        expect(params[:method]).to eq(:post)
        [{ 'data' => { id: 'abc_123' } }, full_response]
      end
      expect(driver_client.task_cancellation(task)).to be_a(Ioki::Model::Driver::Ride)
    end

    it '#task_completion calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/tasks/xyz_123/completion')
        expect(params[:method]).to eq(:post)
        [{ 'data' => { id: 'abc_123' } }, full_response]
      end
      expect(driver_client.task_completion(task)).to be_a(Ioki::Model::Driver::Ride)
    end

    it '#task_phone_call calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/tasks/xyz_123/phone_call')
        expect(params[:method]).to eq(:post)
        [{}, full_response]
      end
      driver_client.task_phone_call(task)
    end

    it '#task_reached_location calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/tasks/xyz_123/reached_location')
        expect(params[:method]).to eq(:patch)
        [{}, full_response]
      end
      driver_client.task_reached_location(task)
    end
  end

  describe 'rides' do
    let(:ride) { Ioki::Model::Driver::Ride.new id: 'xyz_123' }
    let(:passengers) { Ioki::Model::Driver::Passengers.new passengers: [passenger], ride_version: 0 }
    let(:passenger) { Ioki::Model::Driver::Passenger.new type: 'adult', first_name: 'Max', last_name: 'Mustermann' }

    it '#ride_fare_preview calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/rides/xyz_123/fare_preview')
        expect(params[:method]).to eq(:post)
        expect(params[:body]).to include(data: include(passengers: all(include(type: 'adult'))))

        [{ 'data' => { id: 'preview' } }, full_response]
      end
      expect(driver_client.ride_fare_preview(ride, passengers)).to be_a(Ioki::Model::Driver::Fare)
    end

    it '#ride_passengers calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/rides/xyz_123/passengers')
        expect(params[:method]).to eq(:post)
        expect(params[:body]).to include(data: include(ride_version: 0, passengers: all(include(type: 'adult'))))

        [{ 'data' => { id: 'rid_123' } }, full_response]
      end
      expect(driver_client.ride_passengers(ride, passengers)).to be_a(Ioki::Model::Driver::Ride)
    end
  end

  describe 'tips' do
    it '#tips calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/tips')
        [{ 'data' => [{ id: 'xyz_123' }] }, full_response]
      end
      expect(driver_client.tips).to all(be_a(Ioki::Model::Driver::Tip))
    end
    it '#monthly_tip_sums calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/tips/monthly_tip_sums')
        [{ 'data' => { 'date': '2022-03-01' } }, full_response]
      end
      expect(driver_client.monthly_tip_sums).to be_a(Ioki::Model::Driver::MonthlyTipSum)
    end
    it '#tip calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('driver/tips/tip_123')
        [{ 'data' => { 'id': 'tip_123' } }, full_response]
      end
      expect(driver_client.tip('tip_123')).to be_a(Ioki::Model::Driver::Tip)
    end
  end
end
