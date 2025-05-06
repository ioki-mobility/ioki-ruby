# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class ServiceCreditOptions < Base
        def self.schema_path
          'passenger_api--v1--nested_service_credit_options'
        end

        attribute :packages, on: :read, type: :array, class_name: 'Package'
      end
    end
  end
end
