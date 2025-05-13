# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class VehiclePosition < Base
        def self.schema_path
          'operator_api--v20210101--vehicle_position_without_vehicle'
        end

        attribute :product_id, type: :string, on: [:create, :read, :update]
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :accuracy,
                  on:   [:create, :read],
                  type: :float

        attribute :altitude,
                  on:   [:create, :read],
                  type: :float

        attribute :altitude_accuracy,
                  on:   [:create, :read],
                  type: :float

        attribute :heading,
                  on:   [:create, :read],
                  type: :float

        attribute :lat,
                  on:   [:create, :read],
                  type: :float

        attribute :lng,
                  on:   [:create, :read],
                  type: :float

        # attribute :on_route,
        #           on:             [:create, :read],
        #           omit_if_nil_on: :create,
        #           type:           :boolean

        attribute :recorded_at,
                  on:   [:create, :read],
                  type: :date_time

        # attribute :source,
        #           on:   [:create, :read],
        #           type: :string

        attribute :speed,
                  on:   [:create, :read],
                  type: :float
      end
    end
  end
end
