# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Package < Base
        def self.schema_path
          'passenger_api--nested_service_credit_packages'
        end

        attribute :cost, on: :read, type: :object, class_name: 'Money'
        attribute :cost_object, on: :read, type: :object, class_name: 'Money'
        attribute :value, on: :read, type: :object, class_name: 'Money'
        attribute :value_object, on: :read, type: :object, class_name: 'Money'
      end
    end
  end
end
