# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::OperatorApi do
  let(:operator_client) do
    Ioki::Client.new(
      instance_double(
        Ioki::Configuration,
        :config,
        api_base_url:                 'https://app.io.ki/api',
        api_version:                  '1',
        api_client_identifier:        'ID',
        api_client_secret:            'SECRET',
        api_client_version:           'VERSION',
        api_token:                    'TOKEN',
        language:                     'de',
        retry_count:                  1,
        retry_sleep_seconds:          1,
        ignore_deprecated_attributes: true
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

  describe '#products_product_validations(id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/product_validations')
        [result_with_data, full_response]
      end

      expect(operator_client.products_product_validations('0815', options))
        .to be_a(Ioki::Model::Operator::ProductValidation)
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

  describe '#drivers_regenerate_password(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drivers/4711/regenerate_password')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(operator_client.drivers_regenerate_password('0815', '4711'))
        .to be_a(Ioki::Model::Operator::Driver)
    end
  end

  describe '#update_driver_password(product_id, driver_id, ...)' do
    let(:driver) { Ioki::Model::Operator::Driver.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drivers/4711/set_password')
        [result_with_data, full_response]
      end

      expect(operator_client.update_driver_password('0815', '4711', driver, options))
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

  describe '#station_overview(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/overview')
        result_with_index_data
      end

      expect(operator_client.station_overview('0815', options))
        .to all(be_a(Ioki::Model::Operator::Station))
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

  describe '#create_matching_configuration(product_id, matching_configuration)' do
    let(:matching_configuration) { Ioki::Model::Operator::MatchingConfiguration.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/matching_configurations')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_matching_configuration('0815', matching_configuration, options))
        .to be_a(Ioki::Model::Operator::MatchingConfiguration)
    end
  end

  describe '#update_matching_configuration(product_id, matching_configuration)' do
    let(:matching_configuration) { Ioki::Model::Operator::MatchingConfiguration.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/matching_configurations/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_matching_configuration('0815', matching_configuration, options))
        .to be_a(Ioki::Model::Operator::MatchingConfiguration)
    end
  end

  describe '#delete_matching_configuration(product_id, matching_configuration_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/matching_configurations/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_matching_configuration('0815', '4711', options))
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

  describe '#task_lists_recalculate(product_id, task_list_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/recalculate')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(operator_client.task_lists_recalculate('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::TaskList)
    end
  end

  describe '#task_lists_current_journey(product_id, task_list_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/current_journey')
        [result_with_data, full_response]
      end

      expect(operator_client.task_lists_current_journey('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Journey)
    end
  end

  describe '#monitoring(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/monitoring')
        [result_with_data, full_response]
      end

      expect(operator_client.monitoring('0815', options))
        .to all(be_a(Ioki::Model::Operator::TaskList))
    end
  end

  describe '#vehicle_plannings(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/vehicle_plannings')
        [result_with_data, full_response]
      end

      expect(operator_client.vehicle_plannings('0815', options))
        .to all(be_a(Ioki::Model::Operator::TaskList))
    end
  end

  describe '#task_list_overview(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/overview')
        [result_with_data, full_response]
      end

      expect(operator_client.task_list_overview('0815', options))
        .to all(be_a(Ioki::Model::Operator::TaskList))
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

  describe '#rides_cancellation(product_id, ride_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/rides/4711/cancellation')
        [result_with_data, full_response]
      end

      expect(operator_client.rides_cancellation('0815', '4711', options))
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

  describe '#operators' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/operators')
        result_with_index_data
      end

      expect(operator_client.operators(options))
        .to all(be_a(Ioki::Model::Operator::Operator))
    end
  end

  describe '#operator(operator_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/operators/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.operator('4711', options))
        .to be_a(Ioki::Model::Operator::Operator)
    end
  end

  describe '#create_operator' do
    let(:operator) { Ioki::Model::Operator::Operator.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/operators')
        [result_with_data, full_response]
      end

      expect(operator_client.create_operator(operator, options))
        .to be_a(Ioki::Model::Operator::Operator)
    end
  end

  describe '#update_operator(operator)' do
    let(:operator) { Ioki::Model::Operator::Operator.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/operators/4711')
        expect(params[:method]).to eq :patch
        [result_with_data, full_response]
      end

      expect(operator_client.update_operator('4711', operator, options))
        .to be_a(Ioki::Model::Operator::Operator)
    end
  end

  describe '#delete_operator(operator_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/operators/4711')
        result_with_data
      end

      expect(operator_client.delete_operator('4711', options))
        .to be_a(Ioki::Model::Operator::Operator)
    end
  end

  describe '#set_default_operator(operator)' do
    let(:operator) { Ioki::Model::Operator::Operator.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/operators/4711/set_default')
        expect(params[:method]).to eq :patch
        [result_with_data, full_response]
      end

      expect(operator_client.operator_set_default('4711', operator, options))
        .to be_a(Ioki::Model::Operator::Operator)
    end
  end

  describe '#area(product_id, area_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/areas/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.area('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Area)
    end
  end

  describe '#create_line(product_id, line)' do
    let(:line) { Ioki::Model::Operator::Line.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/lines')
        [result_with_data, full_response]
      end

      expect(operator_client.create_line('0815', line, options))
        .to be_a(Ioki::Model::Operator::Line)
    end
  end

  describe '#update_line(product_id, line)' do
    let(:line) { Ioki::Model::Operator::Line.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/lines/4711')
        expect(params[:method]).to eq :patch
        [result_with_data, full_response]
      end

      expect(operator_client.update_line('0815', line, options))
        .to be_a(Ioki::Model::Operator::Line)
    end
  end

  describe '#delete_line(product_id, line_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/lines/4711')
        result_with_data
      end

      expect(operator_client.delete_line('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Line)
    end
  end

  describe '#create_line_stop(product_id, line_id, line_stop)' do
    let(:line_stop) { Ioki::Model::Operator::LineStop.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/lines/0815/line_stops')
        [result_with_data, full_response]
      end

      expect(operator_client.create_line_stop('0815', '0815', line_stop, options))
        .to be_a(Ioki::Model::Operator::LineStop)
    end
  end

  describe '#update_line_stop(product_id, line_id, line_stop)' do
    let(:line_stop) { Ioki::Model::Operator::LineStop.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/lines/0815/line_stops/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.update_line_stop('0815', '0815', line_stop, options))
        .to be_a(Ioki::Model::Operator::LineStop)
    end
  end

  describe '#delete_line_stop(product_id, line_id, line_stop_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/lines/0815/line_stops/4711')
        result_with_data
      end

      expect(operator_client.delete_line_stop('0815', '0815', '4711', options))
        .to be_a(Ioki::Model::Operator::LineStop)
    end
  end

  describe '#users(provider_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815/users')
        result_with_index_data
      end

      expect(operator_client.users('0815', options))
        .to all(be_a(Ioki::Model::Operator::User))
    end
  end

  describe '#user(provider_id, user_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815/users/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.user('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::User)
    end
  end

  describe '#create_ride_inqury(product_id)' do
    let(:ride_inquiry) { Ioki::Model::Operator::RideInquiry.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/ride_inquiry')
        [result_with_data, full_response]
      end

      expect(operator_client.create_ride_inquiry('0815', ride_inquiry, options))
        .to be_a(Ioki::Model::Operator::RideInquiry)
    end
  end

  describe '#create_repositioning_task(product_id, task_list_id)' do
    let(:repositioning_task) { Ioki::Model::Operator::RepositioningTask.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/01/repositioning_tasks')
        [result_with_data, full_response]
      end

      expect(operator_client.create_repositioning_task('0815', '01', repositioning_task, options))
        .to be_a(Ioki::Model::Operator::Task)
    end
  end

  describe '#admin(admin_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/admins/0815')
        [result_with_data, full_response]
      end

      expect(operator_client.admin('0815', options))
        .to be_a(Ioki::Model::Operator::Admin)
    end
  end

  describe '#users_autocomplete(provider_id, ...)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815/users/autocomplete')
        result_with_index_data
      end

      expect(operator_client.users_autocomplete('0815', options))
        .to all(be_a(Ioki::Model::Operator::User))
    end
  end

  describe '#rides_notifications(product_id, ride_id, ...)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/rides/01/notifications')
        result_with_index_data
      end

      expect(operator_client.rides_notifications('0815', '01', options))
        .to all(be_a(Ioki::Model::Operator::Notification))
    end
  end

  describe '#rides_phone_calls(product_id, ride_id, ...)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/rides/01/phone_calls')
        result_with_index_data
      end

      expect(operator_client.rides_phone_calls('0815', '01', options))
        .to all(be_a(Ioki::Model::Operator::PhoneCall))
    end
  end

  describe '#resource_configurations(product_id, vehicle_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711/resource_configurations')
        result_with_index_data
      end

      expect(operator_client.resource_configurations('0815', '4711', options))
        .to all(be_a(Ioki::Model::Operator::ResourceConfiguration))
    end
  end

  describe '#resource_configuration(product_id, vehicle_id, resource_configuration_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711/resource_configurations/5150')
        [result_with_data, full_response]
      end

      expect(operator_client.resource_configuration('0815', '4711', '5150', options))
        .to be_a(Ioki::Model::Operator::ResourceConfiguration)
    end
  end

  describe '#create_resource_configuration(product_id, vehicle_id)' do
    let(:resource_configuration) { Ioki::Model::Operator::ResourceConfiguration.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711/resource_configurations')
        [result_with_data, full_response]
      end

      expect(operator_client.resource_configuration('0815', '4711', resource_configuration, options))
        .to be_a(Ioki::Model::Operator::ResourceConfiguration)
    end
  end

  describe '#update_resource_configuration(product_id, vehicle_id, resource_configuration)' do
    let(:resource_configuration) { Ioki::Model::Operator::ResourceConfiguration.new({ id: '5150' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711/resource_configurations/5150')
        expect(params[:method]).to eq :patch
        [result_with_data, full_response]
      end

      expect(operator_client.update_resource_configuration('0815', '4711', '5150', resource_configuration, options))
        .to be_a(Ioki::Model::Operator::ResourceConfiguration)
    end
  end

  describe '#delete_resource_configuration(product_id, vehicle_id, resource_configuration_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711/resource_configurations/5150')
        result_with_data
      end

      expect(operator_client.delete_resource_configuration('0815', '4711', '5150', options))
        .to be_a(Ioki::Model::Operator::ResourceConfiguration)
    end
  end

  # rubocop:disable Layout/LineLength
  describe '#resource_configuration_set_default_request(product_id, vehicle_id, resource_configuration)' do
    let(:resource_configuration) { Ioki::Model::Operator::ResourceConfiguration.new({ id: '5150' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711/resource_configurations/5150/set_default_request')
        expect(params[:method]).to eq :post
        [result_with_data, full_response]
      end

      expect(
        operator_client
          .resource_configuration_set_default_request('0815', '4711', '5150', resource_configuration, options)
      ).to be_a(Ioki::Model::Operator::ResourceConfiguration)
    end
  end

  describe '#create_sync_resource_configurations_request(product_id, vehicle_id, ResourceConfigurationSync)' do
    let(:resource_configuration_sync) { Ioki::Model::Operator::ResourceConfigurationSync.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711/sync_resource_configurations_request')
        [result_with_data, full_response]
      end

      expect(operator_client.create_sync_resource_configurations_request('0815', '4711', resource_configuration_sync, options))
        .to be_a(Ioki::Model::Operator::ResourceConfigurationSync)
    end
  end
  # rubocop:enable Layout/LineLength

  describe '#rematching_attempts(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/rematching_attempts')
        result_with_index_data
      end

      expect(operator_client.rematching_attempts('0815', options))
        .to all(be_a(Ioki::Model::Operator::RematchingAttempt))
    end
  end

  describe '#rematching_attempt(product_id, rematching_attempt_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/rematching_attempts/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.rematching_attempt('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::RematchingAttempt)
    end
  end

  describe '#create_rematching_attempt(product_id)' do
    let(:rematching_attempt) { Ioki::Model::Operator::RematchingAttempt.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/rematching_attempts')
        [result_with_data, full_response]
      end

      expect(operator_client.create_rematching_attempt('0815', rematching_attempt, options))
        .to be_a(Ioki::Model::Operator::RematchingAttempt)
    end
  end

  describe '#task_list_rematching_suggestions(product_id, task_list_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/task_lists/4711/rematching_suggestions')
        result_with_index_data
      end

      expect(operator_client.task_list_rematching_suggestions('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::RematchingSuggestion)
    end
  end

  describe '#fleet_state' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/fleet_state')
        [result_with_data, full_response]
      end

      expect(operator_client.fleet_state(options)).to be_a Ioki::Model::Operator::FleetState
    end
  end

  describe '#zones(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/zones')
        result_with_index_data
      end

      expect(operator_client.zones('0815', options))
        .to all(be_a(Ioki::Model::Operator::Zone))
    end
  end

  describe '#zone(product_id, zone_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/zones/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.zone('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Zone)
    end
  end

  describe '#create_zone(product_id, zone)' do
    let(:zone) { Ioki::Model::Operator::Zone.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/zones')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_zone('0815', zone, options))
        .to be_a(Ioki::Model::Operator::Zone)
    end
  end

  describe '#update_zone(product_id, zone)' do
    let(:zone) { Ioki::Model::Operator::Zone.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/zones/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_zone('0815', zone, options))
        .to be_a(Ioki::Model::Operator::Zone)
    end
  end

  describe '#delete_zone(product_id, zone_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/zones/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_zone('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Zone)
    end
  end

  describe '#drt_area(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/drt_area')
        [result_with_data, full_response]
      end

      expect(operator_client.drt_area('0815', options))
        .to be_a(Ioki::Model::Operator::Area)
    end
  end

  describe '#intermodal_area(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/intermodal_area')
        [result_with_data, full_response]
      end

      expect(operator_client.intermodal_area('0815', options))
        .to be_a(Ioki::Model::Operator::Area)
    end
  end

  describe '#reporting_scopes' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/reporting/report/scopes')
        result_with_index_data
      end

      expect(operator_client.reporting_scopes(options))
        .to all(be_a(Ioki::Model::Operator::Reporting::ReportScope))
    end
  end

  describe '#reporting_scope_navigation(scope_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/reporting/report/scopes/0815/navigation')
        [result_with_data, full_response]
      end

      expect(operator_client.reporting_scope_navigation('0815', options))
        .to be_a(Ioki::Model::Operator::Reporting::ReportNavigation::ItemGroup)
    end
  end

  describe '#reporting_report_partition_summary(scope, name)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/reporting/report/scopes/0815/reports/a-name/partition_summary')
        [result_with_data, full_response]
      end

      expect(operator_client.reporting_report_partition_summary('0815', 'a-name', options))
        .to be_a(Ioki::Model::Operator::Reporting::ReportPartitionSummary)
    end
  end

  describe '#reporting_rows' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s)
          .to eq('operator/reporting/report/scopes/myscope/reports/myname/partitions/myperiod/rows')
        result_with_index_data
      end

      expect(operator_client.reporting_rows('myscope', 'myname', 'myperiod', options))
        .to all(be_a(Ioki::Model::Operator::Reporting::ReportRow))
    end
  end

  describe '#reporting_report(scope, name)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s)
          .to eq('operator/reporting/report/scopes/myscope/reports/myname')
        [result_with_data, full_response]
      end

      expect(operator_client.reporting_report('myscope', 'myname', options))
        .to be_a(Ioki::Model::Operator::Reporting::Report)
    end
  end

  describe '#reporting_report_partition(scope, name, period_identifier)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s)
          .to eq('operator/reporting/report/scopes/myscope/reports/myname/partitions/myperiod')
        [result_with_data, full_response]
      end

      expect(operator_client.reporting_report_partition('myscope', 'myname', 'myperiod', options))
        .to be_a(Ioki::Model::Operator::Reporting::ReportPartition)
    end
  end

  describe '#cancellation_statements(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/cancellation_statements')
        result_with_index_data
      end

      expect(operator_client.cancellation_statements('0815', options))
        .to all(be_a(Ioki::Model::Operator::CancellationStatement))
    end
  end

  describe '#cancellation_statement(product_id, cancellation_statement_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/cancellation_statements/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.cancellation_statement('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::CancellationStatement)
    end
  end

  describe '#create_cancellation_statement(product_id, cancellation_statement)' do
    let(:cancellation_statement) { Ioki::Model::Operator::CancellationStatement.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/cancellation_statements')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_cancellation_statement('0815', cancellation_statement, options))
        .to be_a(Ioki::Model::Operator::CancellationStatement)
    end
  end

  describe '#update_cancellation_statement(product_id, cancellation_statement)' do
    let(:cancellation_statement) { Ioki::Model::Operator::CancellationStatement.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/cancellation_statements/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_cancellation_statement('0815', cancellation_statement, options))
        .to be_a(Ioki::Model::Operator::CancellationStatement)
    end
  end

  describe '#delete_cancellation_statement(product_id, cancellation_statement_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/cancellation_statements/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_cancellation_statement('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::CancellationStatement)
    end
  end

  describe '#ride_options(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/ride_options')
        result_with_index_data
      end

      expect(operator_client.ride_options('0815', options))
        .to all(be_a(Ioki::Model::Operator::RideOption))
    end
  end

  describe '#ride_option(product_id, ride_option_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/ride_options/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.ride_option('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::RideOption)
    end
  end

  describe '#create_ride_option(product_id, ride_option)' do
    let(:ride_option) { Ioki::Model::Operator::RideOption.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/ride_options')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_ride_option('0815', ride_option, options))
        .to be_a(Ioki::Model::Operator::RideOption)
    end
  end

  describe '#update_ride_option(product_id, ride_option_id, ride_option)' do
    let(:ride_option) { Ioki::Model::Operator::RideOption.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/ride_options/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_ride_option('0815', '4711', ride_option, options))
        .to be_a(Ioki::Model::Operator::RideOption)
    end
  end

  describe '#delete_ride_option(product_id, ride_option_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/ride_options/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_ride_option('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::RideOption)
    end
  end

  describe '#passenger_options(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/passenger_options')
        result_with_index_data
      end

      expect(operator_client.passenger_options('0815', options))
        .to all(be_a(Ioki::Model::Operator::PassengerOption))
    end
  end

  describe '#passenger_option(product_id, passenger_option_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/passenger_options/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.passenger_option('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::PassengerOption)
    end
  end

  describe '#create_passenger_option(product_id, passenger_option)' do
    let(:passenger_option) { Ioki::Model::Operator::PassengerOption.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/passenger_options')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_passenger_option('0815', passenger_option, options))
        .to be_a(Ioki::Model::Operator::PassengerOption)
    end
  end

  describe '#update_passenger_option(product_id, passenger_option_id, passenger_option)' do
    let(:passenger_option) { Ioki::Model::Operator::PassengerOption.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/passenger_options/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_passenger_option('0815', '4711', passenger_option, options))
        .to be_a(Ioki::Model::Operator::PassengerOption)
    end
  end

  describe '#delete_passenger_option(product_id, passenger_option_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/passenger_options/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_passenger_option('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::PassengerOption)
    end
  end

  describe '#passenger_types(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/passenger_types')
        result_with_index_data
      end

      expect(operator_client.passenger_types('0815', options))
        .to all(be_a(Ioki::Model::Operator::PassengerType))
    end
  end

  describe '#passenger_type(product_id, passenger_type_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/passenger_types/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.passenger_type('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::PassengerType)
    end
  end

  describe '#create_passenger_type(product_id, passenger_type)' do
    let(:passenger_type) { Ioki::Model::Operator::PassengerType.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/passenger_types')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_passenger_type('0815', passenger_type, options))
        .to be_a(Ioki::Model::Operator::PassengerType)
    end
  end

  describe '#update_passenger_type(product_id, passenger_type_id, passenger_type)' do
    let(:passenger_type) { Ioki::Model::Operator::PassengerType.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/passenger_types/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_passenger_type('0815', '4711', passenger_type, options))
        .to be_a(Ioki::Model::Operator::PassengerType)
    end
  end

  describe '#delete_passenger_type(product_id, passenger_type_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/passenger_types/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_passenger_type('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::PassengerType)
    end
  end

  describe '#announcements(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/announcements')
        result_with_index_data
      end

      expect(operator_client.announcements('0815', options))
        .to all(be_a(Ioki::Model::Operator::Announcement))
    end
  end

  describe '#announcement(product_id, announcement_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/announcements/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.announcement('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Announcement)
    end
  end

  describe '#create_announcement(product_id, announcement)' do
    let(:announcement) { Ioki::Model::Operator::Announcement.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/announcements')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_announcement('0815', announcement, options))
        .to be_a(Ioki::Model::Operator::Announcement)
    end
  end

  describe '#update_announcement(product_id, announcement_id, announcement)' do
    let(:announcement) { Ioki::Model::Operator::Announcement.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/announcements/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_announcement('0815', '4711', announcement, options))
        .to be_a(Ioki::Model::Operator::Announcement)
    end
  end

  describe '#delete_announcement(product_id, announcement_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/announcements/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_announcement('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Announcement)
    end
  end

  describe '#blacklisted_travel_combinations(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/blacklisted_travel_combinations')
        result_with_index_data
      end

      expect(operator_client.blacklisted_travel_combinations('0815', options))
        .to all(be_a(Ioki::Model::Operator::BlacklistedTravelCombination))
    end
  end

  describe '#blacklisted_travel_combination(product_id, blacklisted_travel_combination_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/blacklisted_travel_combinations/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.blacklisted_travel_combination('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::BlacklistedTravelCombination)
    end
  end

  describe '#create_blacklisted_travel_combination(product_id, blacklisted_travel_combination)' do
    let(:blacklisted_travel_combination) { Ioki::Model::Operator::BlacklistedTravelCombination.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/blacklisted_travel_combinations')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_blacklisted_travel_combination('0815', blacklisted_travel_combination, options))
        .to be_a(Ioki::Model::Operator::BlacklistedTravelCombination)
    end
  end

  # rubocop:disable Layout/LineLength
  describe '#update_blacklisted_travel_combination(product_id, blacklisted_travel_combination_id, blacklisted_travel_combination)' do
    let(:blacklisted_travel_combination) { Ioki::Model::Operator::BlacklistedTravelCombination.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/blacklisted_travel_combinations/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_blacklisted_travel_combination('0815', '4711', blacklisted_travel_combination, options))
        .to be_a(Ioki::Model::Operator::BlacklistedTravelCombination)
    end
  end
  # rubocop:enable Layout/LineLength

  describe '#delete_blacklisted_travel_combination(product_id, blacklisted_travel_combination_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/blacklisted_travel_combinations/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_blacklisted_travel_combination('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::BlacklistedTravelCombination)
    end
  end

  describe '#restricted_areas(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/restricted_areas')
        result_with_index_data
      end

      expect(operator_client.restricted_areas('0815', options))
        .to all(be_a(Ioki::Model::Operator::RestrictedArea))
    end
  end

  describe '#restricted_area(product_id, restricted_area_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/restricted_areas/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.restricted_area('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::RestrictedArea)
    end
  end

  describe '#create_restricted_area(product_id, restricted_area)' do
    let(:restricted_area) { Ioki::Model::Operator::RestrictedArea.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/restricted_areas')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_restricted_area('0815', restricted_area, options))
        .to be_a(Ioki::Model::Operator::RestrictedArea)
    end
  end

  describe '#delete_restricted_area(product_id, restricted_area_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/restricted_areas/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_restricted_area('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::RestrictedArea)
    end
  end

  describe '#update_restricted_area(product_id, restricted_area_id, restricted_area)' do
    let(:restricted_area) { Ioki::Model::Operator::RestrictedArea.new({ id: '4711' }) }
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/restricted_areas/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_restricted_area('0815', '4711', restricted_area, options))
        .to be_a(Ioki::Model::Operator::RestrictedArea)
    end
  end

  describe '#broadcasts(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/broadcasts')
        result_with_index_data
      end

      expect(operator_client.broadcasts('0815', options))
        .to all(be_a(Ioki::Model::Operator::Broadcast))
    end
  end

  describe '#create_broadcast(product_id, broadcast)' do
    let(:broadcast) { Ioki::Model::Operator::Broadcast.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/broadcasts')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_broadcast('0815', broadcast, options))
        .to be_a(Ioki::Model::Operator::Broadcast)
    end
  end

  describe '#driver_emergencies(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_emergencies')
        result_with_index_data
      end

      expect(operator_client.driver_emergencies('0815', options))
        .to all(be_a(Ioki::Model::Operator::DriverEmergency))
    end
  end

  describe '#driver_emergencies_acknowledge(product_id, driver_emergency_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_emergencies/4711/acknowledge')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(operator_client.driver_emergencies_acknowledge('0815', '4711'))
        .to be_a(Ioki::Model::Operator::DriverEmergency)
    end
  end

  describe '#driver_reports(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_reports')
        result_with_index_data
      end

      expect(operator_client.driver_reports('0815', options))
        .to all(be_a(Ioki::Model::Operator::DriverReport))
    end
  end

  describe '#driver_report(product_id, driver_report_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_reports/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.driver_report('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::DriverReport)
    end
  end

  describe '#driver_reports_acknowledge(product_id, driver_report_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_reports/4711/acknowledge')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(operator_client.driver_reports_acknowledge('0815', '4711'))
        .to be_a(Ioki::Model::Operator::DriverReport)
    end
  end

  describe '#venues(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/venues')
        result_with_index_data
      end

      expect(operator_client.venues('0815', options))
        .to all(be_a(Ioki::Model::Operator::Venue))
    end
  end

  describe '#venue(product_id, venue_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/venues/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.venue('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Venue)
    end
  end

  describe '#create_venue(product_id, venue)' do
    let(:venue) { Ioki::Model::Operator::Venue.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/venues')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_venue('0815', venue, options))
        .to be_a(Ioki::Model::Operator::Venue)
    end
  end

  describe '#update_venue(product_id, venue)' do
    let(:venue) { Ioki::Model::Operator::Venue.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/venues/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(operator_client.update_venue('0815', venue, options))
        .to be_a(Ioki::Model::Operator::Venue)
    end
  end

  describe '#delete_venue(product_id, venue_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/venues/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_venue('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Venue)
    end
  end

  describe '#driver_multicasts(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_multicasts')
        result_with_index_data
      end

      expect(operator_client.driver_multicasts('0815', options))
        .to all(be_a(Ioki::Model::Operator::DriverMulticast))
    end
  end

  describe '#driver_multicast(product_id, driver_multicast_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_multicasts/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.driver_multicast('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::DriverMulticast)
    end
  end

  describe '#create_driver_multicast(product_id, driver_multicast)' do
    let(:driver_multicast) { Ioki::Model::Operator::DriverMulticast.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/driver_multicasts')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_driver_multicast('0815', driver_multicast, options))
        .to be_a(Ioki::Model::Operator::DriverMulticast)
    end
  end

  describe '#public_transport_locations(product_id, ...)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/public_transport_locations')
        result_with_index_data
      end

      expect(operator_client.public_transport_locations('0815', options))
        .to all(be_a(Ioki::Model::Operator::PublicTransportLocation))
    end
  end

  describe '#ioki_suite_navigation' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/services/ioki_suite_navigation')
        [result_with_data, full_response]
      end

      expect(operator_client.ioki_suite_navigation)
        .to be_a(Ioki::Model::Operator::IokiSuiteNavigation::Menu)
    end
  end

  describe '#bootstrap' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/bootstrap')
        [result_with_data, full_response]
      end

      expect(operator_client.bootstrap)
        .to be_a(Ioki::Model::Operator::Bootstrap)
    end
  end

  describe '#update_settings' do
    let(:account_settings) { Ioki::Model::Operator::Account::Settings.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/account/settings')
        [result_with_data, full_response]
      end

      expect(operator_client.update_settings(account_settings))
        .to be_a(Ioki::Model::Operator::Admin)
    end
  end

  describe '#create_station_upload_request(product_id, station_id, ...)' do
    let(:upload_request) { Ioki::Model::Operator::UploadRequest.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711/upload_requests')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_station_upload_request('0815', '4711', upload_request, options))
        .to be_a(Ioki::Model::Operator::UploadRequest)
    end
  end

  describe '#create_vehicle_upload_request(product_id, vehicle_id, ...)' do
    let(:upload_request) { Ioki::Model::Operator::UploadRequest.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711/upload_requests')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_vehicle_upload_request('0815', '4711', upload_request, options))
        .to be_a(Ioki::Model::Operator::UploadRequest)
    end
  end

  describe '#create_vehicle_upload_submission(product_id, vehicle_id, upload_request_id, ...)' do
    let(:upload_submission) { Ioki::Model::Operator::UploadSubmission.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711/upload_requests/5150/submissions')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_vehicle_upload_submission('0815', '4711', '5150', upload_submission, options))
        .to be_a(Ioki::Model::Operator::Vehicle)
    end
  end

  describe '#create_station_upload_submission(product_id, station_id, upload_request_id, ...)' do
    let(:upload_submission) { Ioki::Model::Operator::UploadSubmission.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/stations/4711/upload_requests/5150/submissions')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_station_upload_submission('0815', '4711', '5150', upload_submission, options))
        .to be_a(Ioki::Model::Operator::Station)
    end
  end

  describe '#rating_criteria(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815/rating_criteria')
        result_with_index_data
      end

      expect(operator_client.rating_criteria('0815', options))
        .to all(be_a(Ioki::Model::Operator::RatingCriterion))
    end
  end

  describe '#rating_criterion(product_id, rating_criterion_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815/rating_criteria/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.rating_criterion('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::RatingCriterion)
    end
  end

  describe '#admin_notifications_unread_count' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/admin/admin_notifications/unread_count')
        [result_with_data, full_response]
      end

      expect(operator_client.admin_notifications_unread_count)
        .to be_a(Ioki::Model::Operator::AdminNotification::UnreadCount)
    end
  end

  describe '#consentables' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/admin/consentables')
        [result_with_data, full_response]
      end

      expect(operator_client.consentables)
        .to all be_a(Ioki::Model::Operator::Consentable)
    end
  end

  describe '#create_geocoding_session()' do
    let(:geocoding_session) { Ioki::Model::Operator::GeocodingSession.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/geocoding/session')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_geocoding_session(geocoding_session, options))
        .to be_a(Ioki::Model::Operator::GeocodingSession)
    end
  end

  describe '#delete_geocoding_session(id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/geocoding/session/0815')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(operator_client.delete_geocoding_session('0815', options))
        .to be_nil
    end
  end

  describe '#create_geocoding_search(id)' do
    let(:geocoding_search) { Ioki::Model::Operator::GeocodingSearch.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/geocoding/session/0815/search')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(operator_client.create_geocoding_search('0815', geocoding_search, options))
        .to be_a(Ioki::Model::Operator::GeocodingSearchResults)
    end
  end
end
