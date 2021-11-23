# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class VehiclePosition < Ioki::Model::Base
        # Note that this does not inherit from Ioki::Model::Platform::Base because :updated_atis not defined.

        def self.schema_path
          'platform_api--v20210101--vehicle_position_without_vehicle'
        end

        def self.specification_scope
          nil
        end

        attribute :accuracy, on: :read, type: :float
        attribute :altitude, on: :read, type: :float
        attribute :altitude_accuracy, on: :read, type: :float
        attribute :created_at, on: :read, type: :date_time
        attribute :heading, on: :read, type: :float
        attribute :id, on: :read, type: :string
        attribute :lat, on: :read, type: :float
        attribute :lng, on: :read, type: :float
        attribute :product_id, on: :read, type: :string
        attribute :recorded_at, on: :read, type: :date_time
        attribute :speed, on: :read, type: :float
        attribute :type, on: :read, type: :string
      end
    end
  end
end
