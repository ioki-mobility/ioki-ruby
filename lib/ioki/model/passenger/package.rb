# frozen_string_literal: true

require 'ioki/model/passenger/money'

module Ioki
  module Model
    module Passenger
      class Package < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at, :type and :id.

        def self.schema_path
          'passenger_api--nested_service_credit_packages'
        end

        def self.specification_scope
          nil
        end

        attribute :cost_object, on: :read, type: :object, model_class: Money
        attribute :value_object, on: :read, type: :object, model_class: Money
      end
    end
  end
end
