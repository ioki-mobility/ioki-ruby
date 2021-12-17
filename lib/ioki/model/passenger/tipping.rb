# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Tipping < Ioki::Model::Base
        # Note that this does not inherit from Base because :created_at, :updated_at, :type and :id are not defined.

        def self.schema_path
          'passenger_api--product--tipping'
        end

        attribute :minimum, on: :read, type: :object, class_name: 'Money'
        attribute :suggestions, on: :read, type: :array, class_name: 'Money'
      end
    end
  end
end
