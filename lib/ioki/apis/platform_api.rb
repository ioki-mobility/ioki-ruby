# frozen_string_literal: true

require 'ioki/model'
require 'ioki/apis/endpoints/endpoints'

module Ioki
  class PlatformApi
    API_BASE_PATH = 'platform'
    ENDPOINTS = [
      Endpoints::ShowSingular.new(
        :client,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Platform::Client
      ),
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
      Endpoints::ShowSingular.new(
        :client,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Platform::Client
      ),
      Endpoints::Show.new(
        :driver_emergency,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Platform::DriverEmergency
      ),
      Endpoints::Index.new(
        :driver_emergencies,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Platform::DriverEmergency
      ),
      Endpoints.crud_endpoints(
        :pause,
        base_path:   [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Pause
      ),
      Endpoints.crud_endpoints(
        :line,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Platform::Line
      ),
      Endpoints.crud_endpoints(
        :line_stop,
        base_path:   [API_BASE_PATH, 'products', :id, 'lines', :id],
        except:      [:update],
        model_class: Ioki::Model::Platform::LineStop
      ),
      Endpoints.crud_endpoints(
        :receipt,
        base_path:   [API_BASE_PATH, 'providers', :id],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Receipt
      ),
      Endpoints.crud_endpoints(
        :place,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Platform::Place
      ),
      Endpoints.crud_endpoints(
        :station_deactivation,
        base_path:   [API_BASE_PATH, 'products', :id, 'stations', :id],
        paths:       {
          show:  'deactivation',
          index: 'deactivations'
        },
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Deactivation
      ),
      Endpoints.crud_endpoints(
        :task_list_deactivation,
        base_path:   [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        paths:       {
          show:  'deactivation',
          index: 'deactivations'
        },
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Deactivation
      ),
      Endpoints::ShowSingular.new(
        :current_journey,
        base_path:   [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        model_class: Ioki::Model::Platform::Journey
      ),
      Endpoints.crud_endpoints(
        :task_list,
        base_path:   [API_BASE_PATH, 'products', :id],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::TaskList
      ),
      Endpoints.custom_endpoints(
        'task_list',
        actions:     { 'reassign' => :patch },
        path:        [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        model_class: Ioki::Model::Platform::TaskList
      ),
      Endpoints.crud_endpoints(
        :task,
        base_path:   [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Task
      ),
      Endpoints.crud_endpoints(
        :service_credit,
        base_path:   [API_BASE_PATH, 'providers', :id, 'users', :id],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::ServiceCredit
      ),
      Endpoints.crud_endpoints(
        :webhook,
        base_path:   [API_BASE_PATH, 'providers', :id],
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
      ),
      Endpoints.crud_endpoints(
        :announcement,
        base_path:   [API_BASE_PATH, 'products', :id],
        except:      [:create, :update, :delete],
        model_class: Ioki::Model::Platform::Announcement
      ),
      Endpoints::Create.new(
        :phone_verification_request,
        base_path:   [API_BASE_PATH, 'providers', :id],
        path:        'phone_verification_requests',
        model_class: Ioki::Model::Platform::PhoneVerificationRequest
      ),
      Endpoints::Create.new(
        :phone_verification,
        base_path:   [API_BASE_PATH, 'providers', :id],
        path:        'phone_verification_requests/verify',
        model_class: Ioki::Model::Platform::PhoneVerification
      ),
      Endpoints.crud_endpoints(
        :operator,
        base_path:   [API_BASE_PATH, 'providers', :id],
        model_class: Ioki::Model::Platform::Operator
      ),
      Endpoints.custom_endpoints(
        'operators',
        actions:     { 'set_default' => :patch },
        path:        [API_BASE_PATH, 'providers', :id, 'operators', :id],
        model_class: Ioki::Model::Platform::Operator
      )
    ].freeze
  end
end
