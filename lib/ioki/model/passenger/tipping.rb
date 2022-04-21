# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Tipping < Base
        def self.schema_path
          'passenger_api--product--tipping'
        end

        attribute :minimum, on: :read, type: :object, class_name: 'Money'
        attribute :suggestions, on: :read, type: :array, class_name: 'Money'
      end
    end
  end
end
