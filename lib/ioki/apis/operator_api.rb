# frozen_string_literal: true

require 'ioki/model'
require 'ioki/apis/endpoints/endpoints'

module Ioki
  class OperatorApi
    API_BASE_PATH = 'operator'
    ENDPOINTS = [
      Endpoints::Index.new(
        :products,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Platform::Product
      ),
      Endpoints.crud_endpoints(
        :vehicle,
        base_path:   [API_BASE_PATH, 'products', :id],
        model_class: Ioki::Model::Platform::Vehicle
      )
    ].freeze
  end
end
