# frozen_string_literal: true

require 'ioki/model/passenger/calculated_point'

module Ioki
  module Model
    module Passenger
      class Estimation < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at and :id.

        def self.specification_scope
          nil
        end

        def self.schema_path
          'passenger_api--ride_inquiry--estimation'
        end

        attribute :type, on: :read, type: :string
        attribute :confidence, on: :read, type: :float
        attribute :dropoff, on: :read, type: :object, model_class: CalculatedPoint
        attribute :estimation_type, on: :read, type: :string
        attribute :meta_data, on: :read, type: :object # Quote from the API docs: "Additional metadata about the estimation, no specified format (yet)"
        attribute :pickup, on: :read, type: :object, model_class: CalculatedPoint
      end
    end
  end
end
