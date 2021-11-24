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
      Endpoints.crud_endpoints(
        :client,
        base_path:   [API_BASE_PATH, 'client'],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Client
      ),
      Endpoints.crud_endpoints(
        :driver_emergencies,
        base_path:   [API_BASE_PATH, 'products', :product_id, 'driver_emergencies'],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::DriverEmergency
      ),
      Endpoints.crud_endpoints(
        :pauses,
        base_path:   [API_BASE_PATH, 'products', :product_id, 'task_lists', :task_list_id, 'pauses'],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Pause
      ),
      Endpoints.crud_endpoints(
        :receipts,
        base_path:   [API_BASE_PATH, 'providers', :provider_id, 'receipts'],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Receipt
      ),
      Endpoints.crud_endpoints(
        :station_deactivations,
        base_path:   [API_BASE_PATH, 'products', :product_id, 'stations', :station_id, 'deactivations'],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Deactivation
      ),
      Endpoints.crud_endpoints(
        :task_list_deactivations,
        base_path:   [API_BASE_PATH, 'products', :product_id, 'task_lists', :task_list_id, 'deactivations'],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Deactivation
      ),
      Endpoints.crud_endpoints(
        :current_journey,
        base_path:   [API_BASE_PATH, 'products', :product_id, 'task_lists', :id, 'current_journey'],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Journey
      ),
      Endpoints.crud_endpoints(
        :task_lists,
        base_path:   [API_BASE_PATH, 'products', :product_id, 'task_lists'],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::TaskList
      ),
      Endpoints.crud_endpoints(
        :tasks,
        base_path:   [API_BASE_PATH, 'products', :product_id, 'task_lists', :task_list_id, 'tasks'],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Task
      ),
      Endpoints.crud_endpoints(
        :service_credits,
        base_path:   [API_BASE_PATH, 'providers', :provider_id, 'users', :id, 'service_credits'],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::ServiceCredit
      ),
      Endpoints.crud_endpoints(
        :webhooks,
        base_path:   [API_BASE_PATH, 'providers', :provider_id, 'webhooks'],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Webhook
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
