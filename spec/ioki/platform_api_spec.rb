# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::PlatformApi do
  let(:platform_client) do
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
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers')
        result_with_index_data
      end

      expect(platform_client.providers(options))
        .to all(be_a(Ioki::Model::Platform::Provider))
    end
  end

  describe '#provider(id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815')
        [result_with_data, full_response]
      end

      expect(platform_client.provider('0815', options))
        .to be_a(Ioki::Model::Platform::Provider)
    end
  end

  describe '#products' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products')
        result_with_index_data
      end

      expect(platform_client.products(options))
        .to all(be_a(Ioki::Model::Platform::Product))
    end
  end

  describe '#product(id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815')
        [result_with_data, full_response]
      end

      expect(platform_client.product('0815', options))
        .to be_a(Ioki::Model::Platform::Product)
    end
  end

  describe '#stations(product_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/stations')
        result_with_index_data
      end

      expect(platform_client.stations('0815', options))
        .to all(be_a(Ioki::Model::Platform::Station))
    end
  end

  describe '#station(product_id, station_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/stations/4711')
        [result_with_data, full_response]
      end

      expect(platform_client.station('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::Station)
    end
  end

  describe '#create_station(product_id, station)' do
    let(:station) { Ioki::Model::Platform::Station.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/stations')
        [result_with_data, full_response]
      end

      expect(platform_client.create_station('0815', station, options))
        .to be_a(Ioki::Model::Platform::Station)
    end
  end

  describe '#update_station(product_id, station)' do
    let(:station) { Ioki::Model::Platform::Station.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/stations/4711')
        expect(params[:method]).to eq :patch
        [result_with_data, full_response]
      end

      expect(platform_client.update_station('0815', station, options))
        .to be_a(Ioki::Model::Platform::Station)
    end
  end

  describe '#delete_station(product_id, station_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/stations/4711')
        result_with_data
      end

      expect(platform_client.delete_station('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::Station)
    end
  end

  describe '#vehicles(product_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/vehicles')
        result_with_index_data
      end

      expect(platform_client.vehicles('0815', options))
        .to all(be_a(Ioki::Model::Platform::Vehicle))
    end
  end

  describe '#vehicle(product_id, vehicle_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/vehicles/4711')
        [result_with_data, full_response]
      end

      expect(platform_client.vehicle('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::Vehicle)
    end
  end

  describe '#create_vehicle(product_id, vehicle)' do
    let(:vehicle) { Ioki::Model::Platform::Vehicle.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/vehicles')
        [result_with_data, full_response]
      end

      expect(platform_client.create_vehicle('0815', vehicle, options))
        .to be_a(Ioki::Model::Platform::Vehicle)
    end
  end

  describe '#update_vehicle(product_id, vehicle)' do
    let(:vehicle) { Ioki::Model::Platform::Vehicle.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/vehicles/4711')
        [result_with_data, full_response]
      end

      expect(platform_client.update_vehicle('0815', vehicle, options))
        .to be_a(Ioki::Model::Platform::Vehicle)
    end
  end

  describe '#delete_vehicle(product_id, vehicle_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/vehicles/4711')
        result_with_data
      end

      expect(platform_client.delete_vehicle('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::Vehicle)
    end
  end

  describe '#rides(product_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/rides')
        result_with_index_data
      end

      expect(platform_client.rides('0815', options))
        .to all(be_a(Ioki::Model::Platform::Ride))
    end
  end

  describe '#ride(product_id, ride_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/rides/4711')
        [result_with_data, full_response]
      end

      expect(platform_client.ride('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::Ride)
    end
  end

  describe '#create_ride(product_id, ride)' do
    let(:ride) { Ioki::Model::Platform::Ride.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/rides')
        [result_with_data, full_response]
      end

      expect(platform_client.create_ride('0815', ride, options))
        .to be_a(Ioki::Model::Platform::Ride)
    end
  end

  describe '#users(product_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/users')
        result_with_index_data
      end

      expect(platform_client.users('0815', options))
        .to all(be_a(Ioki::Model::Platform::User))
    end
  end

  describe '#user(product_id, user_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/users/4711')
        [result_with_data, full_response]
      end

      expect(platform_client.user('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::User)
    end
  end

  describe '#create_user(product_id, user)' do
    let(:user) { Ioki::Model::Platform::User.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/users')
        [result_with_data, full_response]
      end

      expect(platform_client.create_user('0815', user, options))
        .to be_a(Ioki::Model::Platform::User)
    end
  end

  describe '#update_user(product_id, user)' do
    let(:user) { Ioki::Model::Platform::User.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/users/4711')
        [result_with_data, full_response]
      end

      expect(platform_client.update_user('0815', user, options))
        .to be_a(Ioki::Model::Platform::User)
    end
  end

  describe '#delete_user(product_id, user_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/users/4711')
        result_with_data
      end

      expect(platform_client.delete_user('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::User)
    end
  end

  describe '#drivers(product_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/drivers')
        result_with_index_data
      end

      expect(platform_client.drivers('0815', options))
        .to all(be_a(Ioki::Model::Platform::Driver))
    end
  end

  describe '#driver(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/drivers/4711')
        [result_with_data, full_response]
      end

      expect(platform_client.driver('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::Driver)
    end
  end

  describe '#create_driver(product_id, driver)' do
    let(:driver) { Ioki::Model::Platform::Driver.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/drivers')
        [result_with_data, full_response]
      end

      expect(platform_client.create_driver('0815', driver, options))
        .to be_a(Ioki::Model::Platform::Driver)
    end
  end

  describe '#update_driver(product_id, driver)' do
    let(:driver) { Ioki::Model::Platform::Driver.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/drivers/4711')
        [result_with_data, full_response]
      end

      expect(platform_client.update_driver('0815', driver, options))
        .to be_a(Ioki::Model::Platform::Driver)
    end
  end

  describe '#delete_driver(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/drivers/4711')
        result_with_data
      end

      expect(platform_client.delete_driver('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::Driver)
    end
  end

  describe '#driver_vehicle_connections(product_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/driver_vehicle_connections')
        result_with_index_data
      end

      expect(platform_client.driver_vehicle_connections('0815', options))
        .to all(be_a(Ioki::Model::Platform::DriverVehicleConnection))
    end
  end

  describe '#driver_vehicle_connection(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/driver_vehicle_connections/4711')
        [result_with_data, full_response]
      end

      expect(platform_client.driver_vehicle_connection('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::DriverVehicleConnection)
    end
  end

  describe '#create_driver_vehicle_connection(product_id, driver)' do
    let(:driver_vehicle_connection) { Ioki::Model::Platform::DriverVehicleConnection.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/driver_vehicle_connections')
        [result_with_data, full_response]
      end

      expect(platform_client.create_driver_vehicle_connection('0815', driver_vehicle_connection, options))
        .to be_a(Ioki::Model::Platform::DriverVehicleConnection)
    end
  end

  describe '#update_driver_vehicle_connection(product_id, driver)' do
    let(:driver_vehicle_connection) { Ioki::Model::Platform::DriverVehicleConnection.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/driver_vehicle_connections/4711')
        [result_with_data, full_response]
      end

      expect(platform_client.update_driver_vehicle_connection('0815', driver_vehicle_connection, options))
        .to be_a(Ioki::Model::Platform::DriverVehicleConnection)
    end
  end

  describe '#delete_driver_vehicle_connection(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/driver_vehicle_connections/4711')
        result_with_data
      end

      expect(platform_client.delete_driver_vehicle_connection('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::DriverVehicleConnection)
    end
  end

  describe '#drivers_lock(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/drivers/4711/lock')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(platform_client.drivers_lock('0815', '4711')).to be_a(Ioki::Model::Platform::Driver)
    end
  end

  describe '#drivers_unlock(product_id, driver_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/drivers/4711/unlock')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(platform_client.drivers_unlock('0815', '4711')).to be_a(Ioki::Model::Platform::Driver)
    end
  end

  describe '#drivers_set_pin(product_id, driver_id, pin)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/drivers/4711/set_pin')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(platform_client.drivers_set_pin('0815', '4711', '123456')).to be_a(Ioki::Model::Platform::Driver)
    end
  end

  describe '#create_rating(product_id, ride_id)' do
    let(:rating) { Ioki::Model::Platform::Rating.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/rides/4711/rating')
        [result_with_data, full_response]
      end

      expect(platform_client.create_rating('0815', rating, options))
        .to be_a(Ioki::Model::Platform::Rating)
    end
  end

  describe '#update_rating(product_id, ride_id, rating)' do
    let(:rating) { Ioki::Model::Platform::Rating.new({ id: '1337' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/rides/4711/rating/1337')
        [result_with_data, full_response]
      end

      expect(platform_client.update_rating('0815', '4711', rating, options))
        .to be_a(Ioki::Model::Platform::Rating)
    end
  end

  describe '#delete_rating(product_id, rating_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/rides/4711/rating/1337')
        result_with_data
      end

      expect(platform_client.delete_rating('0815', '4711', '1337', options))
        .to be_a(Ioki::Model::Platform::Rating)
    end
  end

  describe '#create_booking(product_id, ride_id)' do
    let(:booking) { Ioki::Model::Platform::Booking.new }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/rides/4711/booking')
        [result_with_data, full_response]
      end

      expect(platform_client.create_booking('0815', '4711', booking, options))
        .to be_a(Ioki::Model::Platform::Booking)
    end
  end

  describe '#create_request_token(provider_id, user_id)' do
    let(:passenger_request_token) { Ioki::Model::Platform::PassengerRequestToken.new(client_identifier: 'bollerwagen') }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/users/4711/request_tokens')
        [result_with_data, full_response]
      end

      expect(platform_client.create_request_token('0815', '4711', passenger_request_token, options))
        .to be_a(Ioki::Model::Platform::PassengerRequestToken)
    end
  end

  describe '#create_ride_inqury(product_id)' do
    let(:ride_inquiry) { Ioki::Model::Platform::RideInquiry.new }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/ride_inquiry')
        [result_with_data, full_response]
      end

      expect(platform_client.create_ride_inquiry('0815', ride_inquiry, options))
        .to be_a(Ioki::Model::Platform::RideInquiry)
    end
  end

  describe '#announcements' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/announcements')
        result_with_index_data
      end

      expect(platform_client.announcements('0815', options))
        .to all(be_a(Ioki::Model::Platform::Announcement))
    end
  end

  describe '#announcement(product_id, id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/announcements/1337')
        [result_with_data, full_response]
      end

      expect(platform_client.announcement('0815', '1337', options))
        .to be_a(Ioki::Model::Platform::Announcement)
    end
  end

  describe '#create_line(product_id, line)' do
    let(:line) { Ioki::Model::Platform::Line.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/lines')
        [result_with_data, full_response]
      end

      expect(platform_client.create_line('0815', line, options))
        .to eq(Ioki::Model::Platform::Line.new)
    end
  end

  describe '#update_line(product_id, line)' do
    let(:line) { Ioki::Model::Platform::Line.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/lines/4711')
        expect(params[:method]).to eq :patch
        [result_with_data, full_response]
      end

      expect(platform_client.update_line('0815', line, options))
        .to eq(Ioki::Model::Platform::Line.new)
    end
  end

  describe '#delete_line(product_id, line_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/lines/4711')
        result_with_data
      end

      expect(platform_client.delete_line('0815', '4711', options))
        .to eq(Ioki::Model::Platform::Line.new)
    end
  end

  describe '#create_line_stop(product_id, line_id, line_stop)' do
    let(:line_stop) { Ioki::Model::Platform::LineStop.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/lines/0815/line_stops')
        [result_with_data, full_response]
      end

      expect(platform_client.create_line_stop('0815', '0815', line_stop, options))
        .to eq(Ioki::Model::Platform::LineStop.new)
    end
  end

  describe '#delete_line_stop(product_id, line_id, line_stop_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/lines/0815/line_stops/4711')
        result_with_data
      end

      expect(platform_client.delete_line_stop('0815', '0815', '4711', options))
        .to eq(Ioki::Model::Platform::LineStop.new)
    end
  end

  describe '#task_list_reassign(product_id, id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/products/0815/task_lists/1337/reassign')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(platform_client.task_list_reassign('0815', '1337', options))
        .to eq(Ioki::Model::Platform::TaskList.new)
    end
  end

  describe '#operators' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/operators')
        result_with_index_data
      end

      expect(platform_client.operators('0815', options))
        .to all(be_a(Ioki::Model::Platform::Operator))
    end
  end

  describe '#operator(provider_id, id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/operators/1337')
        [result_with_data, full_response]
      end

      expect(platform_client.operator('0815', '1337', options))
        .to be_a(Ioki::Model::Platform::Operator)
    end
  end

  describe '#create_operator(provider_id, operator)' do
    let(:operator) { Ioki::Model::Platform::Operator.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/operators')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      expect(platform_client.create_operator('0815', operator, options))
        .to be_a(Ioki::Model::Platform::Operator)
    end
  end

  describe '#update_operator(provider_id, operator)' do
    let(:operator) { Ioki::Model::Platform::Operator.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/operators/4711')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(platform_client.update_operator('0815', operator, options))
        .to be_a(Ioki::Model::Platform::Operator)
    end
  end

  describe '#delete_line(provider_id, operator_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/operators/4711')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(platform_client.delete_operator('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::Operator)
    end
  end

  describe '#operators_set_default(provider_id, operator_id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/operators/4711/set_default')
        expect(params[:method]).to eq(:patch)
        result_with_data
      end

      expect(platform_client.operators_set_default('0815', '4711', options))
        .to be_a(Ioki::Model::Platform::Operator)
    end
  end

  describe '#create_captcha_solution(id, captcha)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/captchas/0815/solution')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      captcha = Ioki::Model::Platform::Captcha.new(solution: 'w3sd')
      expect(platform_client.create_captcha_solution('0815', captcha, options))
        .to eq(Ioki::Model::Platform::Captcha.new)
    end
  end

  describe '#captcha_regenerate(id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/captchas/0815/regenerate')
        expect(params[:method]).to eq(:patch)
        [result_with_data, full_response]
      end

      expect(platform_client.captcha_regenerate('0815', options))
        .to eq(Ioki::Model::Platform::Captcha.new)
    end
  end

  describe '#create_client_challenge(id, client_challenge)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/client_challenges/0815/solution')
        expect(params[:method]).to eq(:post)
        [result_with_data, full_response]
      end

      client_challenge = Ioki::Model::Platform::ClientChallenge.new(solution: 'w3sd', nonce: '1234')
      expect(platform_client.create_client_challenge('0815', client_challenge, options))
        .to eq(Ioki::Model::Platform::ClientChallenge.new)
    end
  end

  describe '#user_delete_email(provider_id, id)' do
    it 'calls request on the client with expected params' do
      expect(platform_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('platform/providers/0815/users/1337/email')
        expect(params[:method]).to eq(:delete)
        result_with_data
      end

      expect(platform_client.user_email('0815', '1337', options))
        .to eq(Ioki::Model::Platform::UserEmail.new)
    end
  end
end
