# frozen_string_literal: true

require 'ioki/model'
require 'ioki/apis/endpoints/endpoints'

module Ioki
  class OperatorApi
    API_BASE_PATH = 'operator'
    ENDPOINTS = [
      Endpoints.crud_endpoints(
        :provider,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Operator::Provider,
        except:      [:create, :update, :delete]
      ),
      Endpoints.crud_endpoints(
        :product,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Operator::Product,
        except:      [:create, :update, :delete]
      ),
      Endpoints.custom_endpoints(
        'products',
        actions:     { 'product_validations' => :get },
        path:        [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::ProductValidation
      ),
      Endpoints.crud_endpoints(
        :vehicle,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Vehicle
      ),
      Endpoints::Index.new(
        :permissions,
        base_path:   [API_BASE_PATH, 'admin'],
        model_class: Ioki::Model::Operator::Permission
      ),
      Endpoints.crud_endpoints(
        :driver,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Driver
      ),
      Endpoints.custom_endpoints(
        'drivers',
        actions:     { 'lock' => :patch, 'unlock' => :patch, 'regenerate_pin' => :patch, 'set_pin' => :patch },
        path:        [API_BASE_PATH, 'products', :id, 'drivers', :id],
        model_class: Ioki::Model::Operator::Driver
      ),
      Endpoints.crud_endpoints(
        :place,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Place
      ),
      Endpoints.crud_endpoints(
        :station,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Station
      ),
      Endpoints.custom_endpoints(
        'stations',
        actions:     { 'fix' => :patch, 'unfix' => :patch },
        path:        [API_BASE_PATH, 'products', :id, 'stations', :id],
        model_class: Ioki::Model::Operator::Station
      ),
      Endpoints.crud_endpoints(
        :matching_configuration,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::MatchingConfiguration
      ),
      Endpoints.crud_endpoints(
        :task_list,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::TaskList
      ),
      Endpoints.custom_endpoints(
        'task_lists',
        actions:     { 'reassign' => :patch },
        path:        [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        model_class: Ioki::Model::Operator::TaskList
      ),
      Endpoints.custom_endpoints(
        'task_lists',
        actions:     { 'current_journey' => :get },
        path:        [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        model_class: Ioki::Model::Operator::Journey
      ),
      Endpoints.crud_endpoints(
        :pause,
        base_path:   [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        model_class: Ioki::Model::Operator::Pause
      ),
      Endpoints.crud_endpoints(
        :ride,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Ride,
        except:      [:create, :update, :delete]
      ),
      Endpoints.crud_endpoints(
        :task_list_deactivation,
        base_path:   [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        paths:       {
          show:   'deactivations',
          index:  'deactivations',
          create: 'deactivations',
          update: 'deactivations',
          delete: 'deactivations'
        },
        model_class: Ioki::Model::Operator::Deactivation
      ),
      Endpoints.crud_endpoints(
        :station_deactivation,
        base_path:   [API_BASE_PATH, 'products', :id, 'stations', :id],
        paths:       {
          show:   'deactivations',
          index:  'deactivations',
          create: 'deactivations',
          update: 'deactivations',
          delete: 'deactivations'
        },
        model_class: Ioki::Model::Operator::Deactivation
      ),
      Endpoints.crud_endpoints(
        :station_category,
        base_path:   [API_BASE_PATH, 'products', :id],
        paths:       {
          show:   'station_categories',
          create: 'station_categories',
          update: 'station_categories',
          delete: 'station_categories'
        },
        model_class: Ioki::Model::Operator::StationCategory,
        except:      [:index]
      ),
      Endpoints::Index.new(
        :station_categories,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::StationCategory
      ),
      Endpoints.crud_endpoints(
        :driver_vehicle_connection,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::DriverVehicleConnection,
        except:      [:update]
      ),
      Endpoints.crud_endpoints(
        :task,
        base_path:   [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        model_class: Ioki::Model::Operator::Task,
        except:      [:create, :update, :delete]
      ),
      Endpoints.custom_endpoints(
        'tasks',
        actions:     {
          'confirmation' => :post,
          'completion'   => :post,
          'rejection'    => :post,
          'cancellation' => :post
        },
        path:        [API_BASE_PATH, 'products', :id, 'task_lists', :id, 'tasks', :id],
        model_class: Ioki::Model::Operator::Task
      ),
      Endpoints.crud_endpoints(
        :position,
        base_path:   [API_BASE_PATH, 'products', :id, 'vehicles', :id],
        model_class: Ioki::Model::Operator::VehiclePosition,
        except:      [:show, :index, :update, :delete]
      ),
      Endpoints.crud_endpoints(
        :operator,
        base_path:   [API_BASE_PATH, 'providers', :id],
        model_class: Ioki::Model::Operator::Operator,
        except:      [:create, :update, :delete]
      )
    ].freeze
  end
end
