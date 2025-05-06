# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Estimation < Base
        def self.schema_path
          'passenger_api--v1--ride_inquiry--estimation'
        end

        attribute :type, on: :read, type: :string
        attribute :confidence, on: :read, type: :float
        attribute :dropoff, on: :read, type: :object, class_name: 'CalculatedPoint'
        attribute :estimation_type, on: :read, type: :string
        # Quote from the API docs: "Additional metadata about the estimation, no specified format (yet)"
        attribute :meta_data, on: :read, type: :object
        attribute :pickup, on: :read, type: :object, class_name: 'CalculatedPoint'
      end
    end
  end
end
