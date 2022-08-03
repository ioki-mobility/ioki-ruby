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
        model_class: Ioki::Model::Operator::MatchingConfiguration,
        except:      [:create, :update, :delete]
      )
    ].freeze
  end
end
