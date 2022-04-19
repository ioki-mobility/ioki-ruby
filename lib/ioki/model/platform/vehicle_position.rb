# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class VehiclePosition < Ioki::Model::Base
        # Note that this does not inherit from Base because :updated_atis not defined.

        def self.schema_path
          'platform_api--v20210101--vehicle_position_without_vehicle'
        end

        attribute :accuracy, on: [:read, :create], type: :float
        attribute :altitude, on: [:read, :create], type: :float
        attribute :altitude_accuracy, on: [:read, :create], type: :float
        attribute :created_at, on: :read, type: :date_time
        attribute :heading, on: [:read, :create], type: :float
        attribute :id, on: :read, type: :string
        attribute :lat, on: [:read, :create], type: :float
        attribute :lng, on: [:read, :create], type: :float
        attribute :on_route, on: :create, type: :boolean
        attribute :product_id, on: :read, type: :string
        attribute :recorded_at, on: [:read, :create], type: :date_time
        attribute :source, on: :create, type: :string
        attribute :speed, on: [:read, :create], type: :float
        attribute :type, on: :read, type: :string
      end
    end
  end
end
