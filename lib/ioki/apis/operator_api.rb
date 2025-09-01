# frozen_string_literal: true

require 'ioki/model'
require 'ioki/apis/endpoints/endpoints'

module Ioki
  class OperatorApi
    API_BASE_PATH = 'operator'
    ENDPOINTS = [
      Endpoints::ShowSingular.new(
        :bootstrap,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Operator::Bootstrap
      ),
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
        :admin,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Operator::Admin,
        except:      [:create, :update, :delete, :index]
      ),
      Endpoints.crud_endpoints(
        :driver,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Driver
      ),
      Endpoints.custom_endpoints(
        'drivers',
        actions:     {
          'lock'                => :patch,
          'unlock'              => :patch,
          'regenerate_password' => :patch
        },
        path:        [API_BASE_PATH, 'products', :id, 'drivers', :id],
        model_class: Ioki::Model::Operator::Driver
      ),
      Endpoints::Update.new(
        :driver_password,
        base_path:   [API_BASE_PATH, 'products', :id, 'drivers', :id],
        path:        'set_password',
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
      Endpoints.custom_endpoints(
        'stations',
        actions:     { 'batch_destroy' => :delete },
        path:        [API_BASE_PATH, 'products', :id, 'stations'],
        model_class: nil
      ),
      Endpoints::Index.new(
        :station_overview,
        base_path:   [API_BASE_PATH, 'products', :id, 'stations'],
        path:        'overview',
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
        actions:     { 'reassign' => :patch, 'recalculate' => :patch },
        path:        [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        model_class: Ioki::Model::Operator::TaskList
      ),
      Endpoints::Index.new(
        :monitoring,
        base_path:   [API_BASE_PATH, 'products', :id, 'task_lists'],
        model_class: Ioki::Model::Operator::TaskList
      ),
      Endpoints::Index.new(
        :vehicle_plannings,
        base_path:   [API_BASE_PATH, 'products', :id, 'task_lists'],
        model_class: Ioki::Model::Operator::TaskList
      ),
      Endpoints::Index.new(
        :task_list_overview,
        base_path:   [API_BASE_PATH, 'products', :id, 'task_lists'],
        path:        'overview',
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
      Endpoints.custom_endpoints(
        'rides',
        actions:     {
          'cancellation' => :post
        },
        path:        [API_BASE_PATH, 'products', :id, 'rides', :id],
        model_class: Ioki::Model::Operator::Ride
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
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Operator::Operator
      ),
      Endpoints.custom_endpoints(
        :operator,
        actions:     { 'set_default' => :patch },
        path:        [API_BASE_PATH, 'operators', :id],
        model_class: Ioki::Model::Operator::Operator
      ),
      Endpoints.crud_endpoints(
        :area,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Area
      ),
      Endpoints::ShowSingular.new(
        :drt_area,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Area
      ),
      Endpoints::ShowSingular.new(
        :intermodal_area,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Area
      ),
      Endpoints.crud_endpoints(
        :line,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Line
      ),
      Endpoints.crud_endpoints(
        :line_stop,
        base_path:   [API_BASE_PATH, 'products', :id, 'lines', :id],
        except:      [:index, :show],
        model_class: Ioki::Model::Operator::LineStop
      ),
      Endpoints.crud_endpoints(
        :user,
        base_path:   [API_BASE_PATH, 'providers', :id],
        model_class: Ioki::Model::Operator::User,
        except:      [:create, :update, :delete]
      ),
      Endpoints::Create.new(
        :ride_inquiry,
        base_path:   [API_BASE_PATH, 'products', :id],
        path:        'ride_inquiry',
        model_class: Ioki::Model::Operator::RideInquiry
      ),
      Endpoints::Create.new(
        :repositioning_task,
        base_path:            [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        path:                 'repositioning_tasks',
        model_class:          Ioki::Model::Operator::Task,
        outgoing_model_class: Ioki::Model::Operator::RepositioningTask
      ),
      Endpoints::Index.new(
        :users_autocomplete,
        base_path:   [API_BASE_PATH, 'providers', :id, 'users'],
        path:        'autocomplete',
        model_class: Ioki::Model::Operator::User
      ),
      Endpoints::Index.new(
        :rides_notifications,
        base_path:   [API_BASE_PATH, 'products', :id, 'rides', :id],
        path:        'notifications',
        model_class: Ioki::Model::Operator::Notification
      ),
      Endpoints::Index.new(
        :rides_phone_calls,
        base_path:   [API_BASE_PATH, 'products', :id, 'rides', :id],
        path:        'phone_calls',
        model_class: Ioki::Model::Operator::PhoneCall
      ),
      Endpoints.crud_endpoints(
        :resource_configuration,
        base_path:   [API_BASE_PATH, 'products', :id, 'vehicles', :id],
        model_class: Ioki::Model::Operator::ResourceConfiguration
      ),
      Endpoints.custom_endpoints(
        :resource_configuration,
        actions:     { 'set_default_request' => :post },
        path:        [API_BASE_PATH, 'products', :id, 'vehicles', :id, 'resource_configurations', :id],
        model_class: Ioki::Model::Operator::ResourceConfiguration
      ),
      Endpoints::Create.new(
        :sync_resource_configurations_request,
        base_path:   [API_BASE_PATH, 'products', :id, 'vehicles', :id],
        path:        'sync_resource_configurations_request',
        model_class: Ioki::Model::Operator::ResourceConfigurationSync
      ),
      Endpoints.crud_endpoints(
        :rematching_attempt,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::RematchingAttempt,
        except:      [:update, :delete]
      ),
      Endpoints.custom_endpoints(
        :task_list,
        actions:     { 'rematching_suggestions' => :get },
        path:        [API_BASE_PATH, 'products', :id, 'task_lists', :id],
        model_class: Ioki::Model::Operator::RematchingSuggestion
      ),
      Endpoints::ShowSingular.new(
        :fleet_state,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Operator::FleetState
      ),
      Endpoints.crud_endpoints(
        :zone,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Zone
      ),
      Endpoints::Index.new(
        :reporting_scopes,
        base_path:   [API_BASE_PATH, 'reporting', 'report'],
        path:        'scopes',
        model_class: Ioki::Model::Operator::Reporting::ReportScope
      ),
      Endpoints::ShowSingular.new(
        :reporting_scope_navigation,
        base_path:   nil,
        path:        [API_BASE_PATH, 'reporting', 'report', 'scopes', :id, 'navigation'],
        model_class: Ioki::Model::Operator::Reporting::ReportNavigation::ItemGroup
      ),
      Endpoints::ShowSingular.new(
        :reporting_report_partition_summary,
        base_path:   nil,
        path:        [API_BASE_PATH, 'reporting', 'report', 'scopes', :id, 'reports', :name, 'partition_summary'],
        model_class: Ioki::Model::Operator::Reporting::ReportPartitionSummary
      ),
      Endpoints::Index.new(
        :reporting_rows,
        base_path:   [
          API_BASE_PATH, 'reporting', 'report', 'scopes', :scope, 'reports', :name, 'partitions', :period_identifier
        ],
        path:        'rows',
        model_class: Ioki::Model::Operator::Reporting::ReportRow
      ),
      Endpoints::ShowSingular.new(
        :reporting_report,
        base_path:   nil,
        path:        [
          API_BASE_PATH, 'reporting', 'report', 'scopes', :scope, 'reports', :name
        ],
        model_class: Ioki::Model::Operator::Reporting::Report
      ),
      Endpoints::ShowSingular.new(
        :reporting_report_partition,
        base_path:   nil,
        path:        [
          API_BASE_PATH, 'reporting', 'report', 'scopes', :scope, 'reports', :name, 'partitions', :period_identifier
        ],
        model_class: Ioki::Model::Operator::Reporting::ReportPartition
      ),
      Endpoints.crud_endpoints(
        :cancellation_statement,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::CancellationStatement
      ),
      Endpoints.crud_endpoints(
        :ride_option,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::RideOption
      ),
      Endpoints.crud_endpoints(
        :passenger_option,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::PassengerOption
      ),
      Endpoints.crud_endpoints(
        :passenger_type,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::PassengerType
      ),
      Endpoints.crud_endpoints(
        :announcement,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Announcement
      ),
      Endpoints.crud_endpoints(
        :blacklisted_travel_combination,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::BlacklistedTravelCombination
      ),
      Endpoints.crud_endpoints(
        :restricted_area,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::RestrictedArea
      ),
      Endpoints.crud_endpoints(
        :broadcast,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Broadcast,
        except:      [:delete, :show, :update]
      ),
      Endpoints::Index.new(
        :driver_emergencies,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::DriverEmergency
      ),
      Endpoints.custom_endpoints(
        'driver_emergencies',
        actions:     { 'acknowledge' => :patch },
        path:        [API_BASE_PATH, 'products', :id, 'driver_emergencies', :id],
        model_class: Ioki::Model::Operator::DriverEmergency
      ),
      Endpoints.crud_endpoints(
        :driver_report,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::DriverReport,
        except:      [:create, :delete, :update]
      ),
      Endpoints.custom_endpoints(
        'driver_reports',
        actions:     { 'acknowledge' => :patch },
        path:        [API_BASE_PATH, 'products', :id, 'driver_reports', :id],
        model_class: Ioki::Model::Operator::DriverReport
      ),
      Endpoints.crud_endpoints(
        :venue,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::Venue
      ),
      Endpoints.crud_endpoints(
        :driver_multicast,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::DriverMulticast,
        except:      [:update, :delete]
      ),
      Endpoints::Index.new(
        :public_transport_locations,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Operator::PublicTransportLocation
      ),
      Endpoints::ShowSingular.new(
        :ioki_suite_navigation,
        base_path:   nil,
        path:        [
          API_BASE_PATH, 'services', 'ioki_suite_navigation'
        ],
        model_class: Ioki::Model::Operator::IokiSuiteNavigation::Menu
      ),
      Endpoints::UpdateSingular.new(
        :settings,
        base_path:            [API_BASE_PATH, 'account'],
        model_class:          Ioki::Model::Operator::Admin,
        outgoing_model_class: Ioki::Model::Operator::Account::Settings
      ),
      Endpoints::Create.new(
        :station_upload_request,
        base_path:   [API_BASE_PATH, 'products', :id, 'stations', :id],
        path:        'upload_requests',
        model_class: Ioki::Model::Operator::UploadRequest
      ),
      Endpoints::Create.new(
        :vehicle_upload_request,
        base_path:   [API_BASE_PATH, 'products', :id, 'vehicles', :id],
        path:        'upload_requests',
        model_class: Ioki::Model::Operator::UploadRequest
      ),
      Endpoints::Create.new(
        :station_upload_submission,
        base_path:            [API_BASE_PATH, 'products', :id, 'stations', :id, 'upload_requests', :id],
        path:                 'submissions',
        model_class:          Ioki::Model::Operator::Station,
        outgoing_model_class: Ioki::Model::Operator::UploadSubmission
      ),
      Endpoints::Create.new(
        :vehicle_upload_submission,
        base_path:            [API_BASE_PATH, 'products', :id, 'vehicles', :id, 'upload_requests', :id],
        path:                 'submissions',
        model_class:          Ioki::Model::Operator::Vehicle,
        outgoing_model_class: Ioki::Model::Operator::UploadSubmission
      ),
      Endpoints.crud_endpoints(
        :rating_criterion,
        base_path:   [API_BASE_PATH, 'providers', :id],
        model_class: Ioki::Model::Operator::RatingCriterion,
        only:        [:show, :index]
      ),
      Endpoints::ShowSingular.new(
        :admin_notifications_unread_count,
        base_path:   nil,
        path:        [
          API_BASE_PATH, 'admin', 'admin_notifications', 'unread_count'
        ],
        model_class: Ioki::Model::Operator::AdminNotification::UnreadCount
      ),
      Endpoints::Index.new(
        :consentables,
        base_path:   [API_BASE_PATH, 'admin'],
        model_class: Ioki::Model::Operator::Consentable
      )
    ].freeze
  end
end
