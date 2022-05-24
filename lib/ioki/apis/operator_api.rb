# frozen_string_literal: true

require 'ioki/model'
require 'ioki/apis/endpoints/endpoints'

module Ioki
  class OperatorApi
    API_BASE_PATH = 'operator'
    ENDPOINTS = [
      Endpoints.crud_endpoints(
        :product,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Operator::Product,
        except:      [:create, :update, :delete]
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
      )
    ].freeze
  end
end
