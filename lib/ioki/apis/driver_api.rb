# frozen_string_literal: true

require 'ioki/model'
require 'ioki/apis/endpoints/endpoints'
require 'ioki/apis/endpoints/vehicle_connection'

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
      Endpoints::VehicleConnection.new
    ].freeze
  end
end
