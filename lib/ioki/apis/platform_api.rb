# frozen_string_literal: true

require 'ioki/model'
require 'ioki/apis/endpoints/endpoints'

module Ioki
  class PlatformApi
    API_BASE_PATH = 'platform'
    ENDPOINTS = [
      Endpoints.crud_endpoints(
        :station,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Platform::Station
      ),
      Endpoints.crud_endpoints(
        :vehicle,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Platform::Vehicle
      ),
      Endpoints.crud_endpoints(
        :ride,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Platform::Ride,
        except:      [:update, :delete]
      ),
      Endpoints.crud_endpoints(
        :rating,
        base_path:   [API_BASE_PATH, 'products', :id, 'rides', :id],
        paths:       {
          create: 'rating',
          update: 'rating',
          delete: 'rating'
        },
        model_class: Ioki::Model::Platform::Rating,
        except:      [:index, :show]
      ),
      Endpoints.crud_endpoints(
        :user,
        base_path:   [API_BASE_PATH, 'providers', :id],
        model_class: Ioki::Model::Platform::User
      ),
      Endpoints.crud_endpoints(
        :driver,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Platform::Driver
      ),
      Endpoints.crud_endpoints(
        :driver_vehicle_connection,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Platform::DriverVehicleConnection
      ),
      Endpoints::Index.new(
        :providers,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Platform::Provider
      ),
      Endpoints::Show.new(
        :provider,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Platform::Provider
      ),
      Endpoints::Index.new(
        :products,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Platform::Product
      ),
      Endpoints::Show.new(
        :product,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Platform::Product
      ),
      Endpoints::Create.new(
        :booking,
        base_path:   [API_BASE_PATH, 'products', :id, 'rides', :id],
        path:        'booking',
        model_class: Ioki::Model::Platform::Booking
      ),
      Endpoints::Create.new(
        :request_token,
        base_path:   [API_BASE_PATH, 'providers', :id, 'users', :id],
        model_class: Ioki::Model::Platform::PassengerRequestToken
      ),
      Endpoints::Create.new(
        :ride_inquiry,
        base_path:   [API_BASE_PATH, 'products', :id],
        path:        'ride_inquiry',
        model_class: Ioki::Model::Platform::RideInquiry
      ),
      Endpoints.custom_endpoints(
        'drivers',
        actions:     { 'lock' => :patch, 'unlock' => :patch, 'set_pin' => :patch },
        path:        [API_BASE_PATH, 'products', :id, 'drivers', :id],
        model_class: Ioki::Model::Platform::Driver
      )
    ].freeze
  end
end
