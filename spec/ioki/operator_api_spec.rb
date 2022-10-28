# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::OperatorApi do
  let(:operator_client) do
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

  describe '#providers' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers')
        result_with_index_data
      end

      expect(operator_client.providers(options))
        .to all(be_a(Ioki::Model::Operator::Provider))
    end
  end

  describe '#provider(id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815')
        [result_with_data, full_response]
      end

      expect(operator_client.provider('0815', options))
        .to be_a(Ioki::Model::Operator::Provider)
    end
  end

  describe '#products' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products')
        result_with_index_data
      end

      expect(operator_client.products(options))
        .to all(be_a(Ioki::Model::Operator::Product))
    end
  end

  describe '#product(id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815')
        [result_with_data, full_response]
      end

      expect(operator_client.product('0815', options))
        .to be_a(Ioki::Model::Operator::Product)
    end
  end

  describe '#vehicles(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles')
        result_with_index_data
      end

      expect(operator_client.vehicles('0815', options))
        .to all(be_a(Ioki::Model::Operator::Vehicle))
    end
  end

  describe '#vehicle(product_id, vehicle_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.vehicle('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Vehicle)
    end
  end

  describe '#create_vehicle(product_id, vehicle)' do
    let(:vehicle) { Ioki::Model::Operator::Vehicle.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_vehicle('0815', vehicle, options))
        .to be_a(Ioki::Model::Operator::Vehicle)
    end
  end

  describe '#update_vehicle(product_id, vehicle)' do
    let(:vehicle) { Ioki::Model::Operator::Vehicle.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_vehicle('0815', vehicle, options))
        .to be_a(Ioki::Model::Operator::Vehicle)
    end
  end

  describe '#delete_vehicle(product_id, vehicle_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_vehicle('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Vehicle)
    end
  end

  describe '#drivers(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drivers')
        result_with_index_data
      end

      expect(operator_client.drivers('0815', options))
        .to all(be_a(Ioki::Model::Operator::Driver))
    end
  end

  describe '#driver(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drivers/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.driver('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Driver)
    end
  end

  describe '#create_driver(product_id, driver)' do
    let(:driver) { Ioki::Model::Operator::Driver.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drivers')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_driver('0815', driver, options))
        .to be_a(Ioki::Model::Operator::Driver)
    end
  end

  describe '#update_driver(product_id, driver)' do
    let(:driver) { Ioki::Model::Operator::Driver.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drivers/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_driver('0815', driver, options))
        .to be_a(Ioki::Model::Operator::Driver)
    end
  end

  describe '#delete_driver(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drivers/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_driver('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Driver)
    end
  end

  describe '#drivers_lock(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drivers/4711/lock')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(operator_client.drivers_lock('0815', '4711'))
        .to be_a(Ioki::Model::Operator::Driver)
    end
  end

  describe '#drivers_unlock(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drivers/4711/unlock')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(operator_client.drivers_unlock('0815', '4711'))
        .to be_a(Ioki::Model::Operator::Driver)
    end
  end

  describe '#drivers_regenerate_pin(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drivers/4711/regenerate_pin')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(operator_client.drivers_regenerate_pin('0815', '4711'))
        .to be_a(Ioki::Model::Operator::Driver)
    end
  end

  describe '#drivers_set_pin(product_id, driver_id, pin)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drivers/4711/set_pin')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(operator_client.drivers_set_pin('0815', '4711', '123456'))
        .to be_a(Ioki::Model::Operator::Driver)
    end
  end

  describe '#places(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/places')
        result_with_index_data
      end

      expect(operator_client.places('0815', options))
        .to all(be_a(Ioki::Model::Operator::Place))
    end
  end

  describe '#place(product_id, place_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/places/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.place('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Place)
    end
  end

  describe '#create_place(product_id, place)' do
    let(:place) { Ioki::Model::Operator::Place.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/places')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_place('0815', place, options))
        .to be_a(Ioki::Model::Operator::Place)
    end
  end

  describe '#update_place(product_id, place)' do
    let(:place) { Ioki::Model::Operator::Place.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/places/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_place('0815', place, options))
        .to be_a(Ioki::Model::Operator::Place)
    end
  end

  describe '#delete_place(product_id, place_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/places/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_place('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Place)
    end
  end

  describe '#stations(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations')
        result_with_index_data
      end

      expect(operator_client.stations('0815', options))
        .to all(be_a(Ioki::Model::Operator::Station))
    end
  end

  describe '#station(product_id, station_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.station('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Station)
    end
  end

  describe '#create_station(product_id, station)' do
    let(:station) { Ioki::Model::Operator::Station.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_station('0815', station, options))
        .to be_a(Ioki::Model::Operator::Station)
    end
  end

  describe '#update_station(product_id, station)' do
    let(:station) { Ioki::Model::Operator::Station.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_station('0815', station, options))
        .to be_a(Ioki::Model::Operator::Station)
    end
  end

  describe '#delete_station(product_id, station_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_station('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Station)
    end
  end

  describe '#stations_fix(product_id, station_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711/fix')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(operator_client.stations_fix('0815', '4711'))
        .to be_a(Ioki::Model::Operator::Station)
    end
  end

  describe '#stations_unfix(product_id, station_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711/unfix')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(operator_client.stations_unfix('0815', '4711'))
        .to be_a(Ioki::Model::Operator::Station)
    end
  end

  describe '#matching_configurations(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/matching_configurations')
        result_with_index_data
      end

      expect(operator_client.matching_configurations('0815', options))
        .to all(be_a(Ioki::Model::Operator::MatchingConfiguration))
    end
  end

  describe '#matching_configuration(product_id, matching_configuration_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/matching_configurations/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.matching_configuration('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::MatchingConfiguration)
    end
  end

  describe '#task_lists(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists')
        result_with_index_data
      end

      expect(operator_client.task_lists('0815', options))
        .to all(be_a(Ioki::Model::Operator::TaskList))
    end
  end

  describe '#task_list(product_id, task_list_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.task_list('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::TaskList)
    end
  end

  describe '#create_task_list(product_id, task_list)' do
    let(:task_list) { Ioki::Model::Operator::TaskList.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_task_list('0815', task_list, options))
        .to be_a(Ioki::Model::Operator::TaskList)
    end
  end

  describe '#update_task_list(product_id, task_list)' do
    let(:task_list) { Ioki::Model::Operator::TaskList.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_task_list('0815', task_list, options))
        .to be_a(Ioki::Model::Operator::TaskList)
    end
  end

  describe '#delete_task_list(product_id, task_list_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_task_list('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::TaskList)
    end
  end

  describe '#task_lists_reassign(product_id, task_list_id)' do
    let(:options) do
      {
        body: {
          'data' => {
            'vehicle_id' => 'vehicle_123456'
          }
        }
      }
    end

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/reassign')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(operator_client.task_lists_reassign('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::TaskList)
    end
  end

  describe '#pauses(product_id, task_list_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/pauses')
        result_with_index_data
      end

      expect(operator_client.pauses('0815', '4711', options))
        .to all(be_a(Ioki::Model::Operator::Pause))
    end
  end

  describe '#pause(product_id, task_list_id, pause_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/pauses/5105')
        [result_with_data, full_response]
      end

      expect(operator_client.pause('0815', '4711', '5105', options))
        .to be_a(Ioki::Model::Operator::Pause)
    end
  end

  describe '#create_pause(product_id, task_list_id, pause)' do
    let(:pause) { Ioki::Model::Operator::Pause.new({ id: '5105' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/pauses')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_pause('0815', '4711', pause, options))
        .to be_a(Ioki::Model::Operator::Pause)
    end
  end

  describe '#update_pause(product_id, task_list_id, pause)' do
    let(:pause) { Ioki::Model::Operator::Pause.new({ id: '5105' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/pauses/5105')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_pause('0815', '4711', pause, options))
        .to be_a(Ioki::Model::Operator::Pause)
    end
  end

  describe '#delete_pause(product_id, task_list_id, pause_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/pauses/5105')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_pause('0815', '4711', '5105', options))
        .to be_a(Ioki::Model::Operator::Pause)
    end
  end

  describe '#rides(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/rides')
        result_with_index_data
      end

      expect(operator_client.rides('0815', options))
        .to all(be_a(Ioki::Model::Operator::Ride))
    end
  end

  describe '#ride(product_id, ride_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/rides/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.ride('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Ride)
    end
  end

  describe '#task_list_deactivations(product_id, task_list_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/deactivations')
        result_with_index_data
      end

      expect(operator_client.task_list_deactivations('0815', '4711', options))
        .to all(be_a(Ioki::Model::Operator::Deactivation))
    end
  end

  describe '#task_list_deactivation(product_id, task_list_id, deactivation_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/deactivations/5105')
        [result_with_data, full_response]
      end

      expect(operator_client.task_list_deactivation('0815', '4711', '5105', options))
        .to be_a(Ioki::Model::Operator::Deactivation)
    end
  end

  describe '#create_task_list_deactivation(product_id, task_list_id, deactivation)' do
    let(:deactivation) { Ioki::Model::Operator::Deactivation.new({ id: '5105' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/deactivations')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_task_list_deactivation('0815', '4711', deactivation, options))
        .to be_a(Ioki::Model::Operator::Deactivation)
    end
  end

  describe '#update_task_list_deactivation(product_id, task_list_id, deactivation)' do
    let(:deactivation) { Ioki::Model::Operator::Deactivation.new({ id: '5105' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/deactivations/5105')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_task_list_deactivation('0815', '4711', deactivation, options))
        .to be_a(Ioki::Model::Operator::Deactivation)
    end
  end

  describe '#delete_task_list_deactivation(product_id, task_list_id, deactivation_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/deactivations/5105')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_task_list_deactivation('0815', '4711', '5105', options))
        .to be_a(Ioki::Model::Operator::Deactivation)
    end
  end

  describe '#station_deactivations(product_id, station_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711/deactivations')
        result_with_index_data
      end

      expect(operator_client.station_deactivations('0815', '4711', options))
        .to all(be_a(Ioki::Model::Operator::Deactivation))
    end
  end

  describe '#station_deactivation(product_id, station_id, deactivation_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711/deactivations/5105')
        [result_with_data, full_response]
      end

      expect(operator_client.station_deactivation('0815', '4711', '5105', options))
        .to be_a(Ioki::Model::Operator::Deactivation)
    end
  end

  describe '#create_station_deactivation(product_id, station_id, deactivation)' do
    let(:deactivation) { Ioki::Model::Operator::Deactivation.new({ id: '5105' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711/deactivations')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_station_deactivation('0815', '4711', deactivation, options))
        .to be_a(Ioki::Model::Operator::Deactivation)
    end
  end

  describe '#update_station_deactivation(product_id, station_id, deactivation)' do
    let(:deactivation) { Ioki::Model::Operator::Deactivation.new({ id: '5105' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711/deactivations/5105')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_station_deactivation('0815', '4711', deactivation, options))
        .to be_a(Ioki::Model::Operator::Deactivation)
    end
  end

  describe '#delete_station_deactivation(product_id, station_id, deactivation_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711/deactivations/5105')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_station_deactivation('0815', '4711', '5105', options))
        .to be_a(Ioki::Model::Operator::Deactivation)
    end
  end

  describe '#station_categories(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/station_categories')
        result_with_index_data
      end

      expect(operator_client.station_categories('0815', options))
        .to all(be_a(Ioki::Model::Operator::StationCategory))
    end
  end

  describe '#station_category(product_id, station_category_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/station_categories/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.station_category('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::StationCategory)
    end
  end

  describe '#create_station_category(product_id, station_category)' do
    let(:station_category) { Ioki::Model::Operator::StationCategory.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/station_categories')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_station_category('0815', station_category, options))
        .to be_a(Ioki::Model::Operator::StationCategory)
    end
  end

  describe '#update_station_category(product_id, station_category)' do
    let(:station_category) { Ioki::Model::Operator::StationCategory.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/station_categories/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_station_category('0815', station_category, options))
        .to be_a(Ioki::Model::Operator::StationCategory)
    end
  end

  describe '#delete_station_category(product_id, station_category_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/station_categories/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_station_category('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::StationCategory)
    end
  end

  describe '#driver_vehicle_connections(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_vehicle_connections')
        result_with_index_data
      end

      expect(operator_client.driver_vehicle_connections('0815', options))
        .to all(be_a(Ioki::Model::Operator::DriverVehicleConnection))
    end
  end

  describe '#driver_vehicle_connection(product_id, driver_vehicle_connection_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_vehicle_connections/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.driver_vehicle_connection('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::DriverVehicleConnection)
    end
  end

  describe '#create_driver_vehicle_connection(product_id, driver_id, vehicle_id)' do
    let(:driver_vehicle_connection) { Ioki::Model::Operator::DriverVehicleConnection.new({ id: '5105' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_vehicle_connections')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_driver_vehicle_connection('0815', driver_vehicle_connection, options))
        .to be_a(Ioki::Model::Operator::DriverVehicleConnection)
    end
  end

  describe '#delete_driver_vehicle_connection(product_id, driver_vehicle_connection_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_vehicle_connections/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_driver_vehicle_connection('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::DriverVehicleConnection)
    end
  end

  describe '#tasks(product_id, task_list_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/tasks')
        result_with_index_data
      end

      expect(operator_client.tasks('0815', '4711', options))
        .to all(be_a(Ioki::Model::Operator::Task))
    end
  end

  describe '#task(product_id, task_list_id, task_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/tasks/5105')
        [result_with_data, full_response]
      end

      expect(operator_client.task('0815', '4711', '5105', options))
        .to be_a(Ioki::Model::Operator::Task)
    end
  end

  describe '#tasks_confirmation(product_id, task_list_id, task_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/tasks/5105/confirmation')
        expect(params[:method]).to eq(:post)
        result_with_data
      end

      expect(operator_client.tasks_confirmation('0815', '4711', '5105'))
        .to be_a(Ioki::Model::Operator::Task)
    end
  end

  describe '#tasks_completion(product_id, task_list_id, task_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/tasks/5105/completion')
        expect(params[:method]).to eq(:post)
        result_with_data
      end

      expect(operator_client.tasks_completion('0815', '4711', '5105'))
        .to be_a(Ioki::Model::Operator::Task)
    end
  end

  describe '#tasks_rejection(product_id, task_list_id, task_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/tasks/5105/rejection')
        expect(params[:method]).to eq(:post)
        result_with_data
      end

      expect(operator_client.tasks_rejection('0815', '4711', '5105'))
        .to be_a(Ioki::Model::Operator::Task)
    end
  end

  describe '#tasks_cancellation(product_id, task_list_id, task_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/tasks/5105/cancellation')
        expect(params[:method]).to eq(:post)
        result_with_data
      end

      expect(operator_client.tasks_cancellation('0815', '4711', '5105'))
        .to be_a(Ioki::Model::Operator::Task)
    end
  end

  describe '#create_rating(product_id, ride_id)' do
    let(:rating) { Ioki::Model::Operator::Rating.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/rides/4711/rating')
        [result_with_data, full_response]
      end

      expect(operator_client.create_rating('0815', rating, options))
        .to be_a(Ioki::Model::Operator::Rating)
    end
  end

  describe '#update_rating(product_id, ride_id, rating)' do
    let(:rating) { Ioki::Model::Operator::Rating.new({ id: '1337' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/rides/4711/rating/1337')
        [result_with_data, full_response]
      end

      expect(operator_client.update_rating('0815', '4711', rating, options))
        .to be_a(Ioki::Model::Operator::Rating)
    end
  end

  describe '#delete_rating(product_id, rating_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/rides/4711/rating/1337')
        result_with_data
      end

      expect(operator_client.delete_rating('0815', '4711', '1337', options))
        .to be_a(Ioki::Model::Operator::Rating)
    end
  end

  describe '#create_position(product_id, vehicle_id, vehicle_position)' do
    let(:vehicle_position) { Ioki::Model::Operator::VehiclePosition.new({ id: '5105' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711/positions')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_position('0815', '4711', vehicle_position, options))
        .to be_a(Ioki::Model::Operator::VehiclePosition)
    end
  end
end
