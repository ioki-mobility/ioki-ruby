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

  describe '#operators(provider_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815/operators')
        result_with_index_data
      end

      expect(operator_client.operators('0815', options))
        .to all(be_a(Ioki::Model::Operator::Operator))
    end
  end

  describe '#operator(provider_id, operator_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815/operators/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.operator('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Operator)
    end
  end

  describe '#create_operator(provider_id)' do
    let(:operator) { Ioki::Model::Operator::Operator.new }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815/operators')
        [result_with_data, full_response]
      end

      expect(operator_client.create_operator('0815', operator, options))
        .to be_a(Ioki::Model::Operator::Operator)
    end
  end

  describe '#update_operator(product_id, operator)' do
    let(:operator) { Ioki::Model::Operator::Operator.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815/operators/4711')
        expect(params[:method]).to eq :patch
        [result_with_data, full_response]
      end

      expect(operator_client.update_operator('0815', operator, options))
        .to be_a(Ioki::Model::Operator::Operator)
    end
  end

  describe '#delete_operator(product_id, operator_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815/operators/4711')
        result_with_data
      end

      expect(operator_client.delete_operator('0815', '4711', options))
        .to be_a(Ioki::Model::Operator::Operator)
    end
  end

  describe '#set_default_operator(product_id, operator)' do
    let(:operator) { Ioki::Model::Operator::Operator.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/providers/0815/operators/4711/set_default')
        expect(params[:method]).to eq :patch
        [result_with_data, full_response]
      end

      expect(operator_client.operator_set_default('0815', operator, options))
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

  describe '#reporting_scope_structure(scope_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/reporting/report/scopes/0815/structure')
        [result_with_data, full_response]
      end

      expect(operator_client.reporting_scope_structure('0815', options))
        .to be_a(Ioki::Model::Operator::Reporting::ReportStructure::ItemGroup)
    end
  end

  describe '#reporting_report_type_summary(scope, local_year, name, period_identifier, version)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/reporting/report/scopes/0815/report_types/a-name/summary')
        [result_with_data, full_response]
      end

      expect(operator_client.reporting_report_type_summary('0815', 'a-name', options))
        .to be_a(Ioki::Model::Operator::Reporting::ReportTypeSummary)
    end
  end

  describe '#reporting_rows' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s)
          .to eq('operator/reporting/report/scopes/myscope/reports/myyear/myname/myperiod/myversion/rows')
        result_with_index_data
      end

      expect(operator_client.reporting_rows('myscope', 'myyear', 'myname', 'myperiod', 'myversion', options))
        .to all(be_a(Ioki::Model::Operator::Reporting::ReportRow))
    end
  end

  describe '#reporting_report(scope, local_year, name, period_identifier, version)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s)
          .to eq('operator/reporting/report/scopes/myscope/reports/myyear/myname/myperiod/myversion')
        [result_with_data, full_response]
      end

      expect(operator_client.reporting_report('myscope', 'myyear', 'myname', 'myperiod', 'myversion', options))
        .to be_a(Ioki::Model::Operator::Reporting::Report)
    end
  end
end
