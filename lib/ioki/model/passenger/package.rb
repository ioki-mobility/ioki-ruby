# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Package < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at, :type and
        # :id.

        def self.schema_path
          'passenger_api--nested_service_credit_packages'
        end

        attribute :cost_object, on: :read, type: :object, class_name: 'Money'
        attribute :value_object, on: :read, type: :object, class_name: 'Money'
      end
    end
  end
end
