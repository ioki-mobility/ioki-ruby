# frozen_string_literal: true

require 'ioki/model'
require 'ioki/apis/endpoints/endpoints'
require 'ioki/apis/endpoints/driver/create_vehicle_connection'
require 'ioki/apis/endpoints/driver/delete_vehicle_connection'

module Ioki
  class DriverApi
    API_BASE_PATH = 'driver'

    ENDPOINTS = [
      Endpoints::Create.new(
        :request_token,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Driver::DriverRequestToken
      ),
      Endpoints::ShowSingular.new(
        :product,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Driver::Product
      ),
      Endpoints::ShowSingular.new(
        :driver,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Driver::Driver
      ),
      Endpoints::ShowSingular.new(
        :vehicle,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Driver::Vehicle
      ),
      Endpoints::Endpoint.new(
        :vehicle,
        action:         'pause',
        request_method: :post,
        path:           [API_BASE_PATH, 'vehicle'],
        model_class:    Ioki::Model::Driver::Vehicle
      ),
      Endpoints::Endpoint.new(
        :vehicle,
        method_name:    :vehicle_unpause,
        action:         'pause',
        request_method: :delete,
        path:           [API_BASE_PATH, 'vehicle'],
        model_class:    Ioki::Model::Driver::Vehicle
      ),
      Endpoints::Driver::CreateVehicleConnection.new,
      Endpoints::Driver::DeleteVehicleConnection.new,
      Endpoints::Index.new(
        :tasks,
        base_path:   [API_BASE_PATH, 'vehicle'],
        model_class: Ioki::Model::Driver::Task
      ),
      Endpoints::Create.new(
        :task_confirmation,
        method_name:          :task_confirmation,
        base_path:            [API_BASE_PATH, 'tasks', :id],
        path:                 'confirmation',
        model_class:          Ioki::Model::Driver::Ride,
        outgoing_model_class: Ioki::Model::Driver::Task
      ),
      Endpoints::Create.new(
        :task_rejection,
        method_name:          :task_rejection,
        base_path:            [API_BASE_PATH, 'tasks', :id],
        path:                 'rejection',
        model_class:          Ioki::Model::Driver::Ride,
        outgoing_model_class: Ioki::Model::Driver::Task
      ),
      Endpoints::Create.new(
        :task_cancellation,
        method_name:          :task_cancellation,
        base_path:            [API_BASE_PATH, 'tasks', :id],
        path:                 'cancellation',
        model_class:          Ioki::Model::Driver::Ride,
        outgoing_model_class: Ioki::Model::Driver::Task
      ),
      Endpoints::Create.new(
        :task_completion,
        method_name:          :task_completion,
        base_path:            [API_BASE_PATH, 'tasks', :id],
        path:                 'completion',
        model_class:          Ioki::Model::Driver::Ride,
        outgoing_model_class: Ioki::Model::Driver::Task
      ),
      Endpoints::Create.new(
        :task_phone_call,
        method_name: :task_phone_call,
        base_path:   [API_BASE_PATH, 'tasks', :id],
        path:        'phone_call',
        model_class: Ioki::Model::Driver::Task
      ),
      Endpoints::Endpoint.new(
        :task_reached_location,
        action:         'reached_location',
        method_name:    :task_reached_location,
        request_method: :patch,
        path:           [API_BASE_PATH, 'tasks', :id]
      )
    ].freeze
  end
end
