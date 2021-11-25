# frozen_string_literal: true

require 'ioki/model/passenger/package'

module Ioki
  module Model
    module Passenger
      class ServiceCreditOptions < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at, :type and :id.

        def self.schema_path
          'passenger_api--nested_service_credit_options'
        end

        def self.specification_scope
          nil
        end

        attribute :packages, on: :read, type: :array, model_class: Package
      end
    end
  end
end
