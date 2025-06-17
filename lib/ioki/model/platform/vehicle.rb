# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Vehicle < Base
        attribute :operation_area_id, type: :string, on: [:create, :read, :update]
        attribute :wheelchair_bays, type: :integer, on: [:create, :read, :update]
        attribute :walker_bays, type: :integer, on: [:create, :read, :update]
        attribute :storage_spaces, type: :integer, on: [:create, :read, :update]
        attribute :seats, type: :integer, on: [:create, :read, :update]
        attribute :operation_area, type: :string, on: [:create, :read, :update]
        attribute :matching_rank, type: :integer, on: [:create, :read, :update]
        attribute :door_control_available, type: :boolean, on: [:create, :read, :update]
        attribute :supports_open_door_requests, type: :boolean, on: [:create, :read, :update]
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :autonomous,
                  on:   :read,
                  type: :boolean

        attribute :connected_driver_id,
                  on:   :read,
                  type: :string

        attribute :default_resource_configuration,
                  on:         [:create, :read, :update],
                  type:       :object,
                  class_name: 'ResourceConfiguration'

        attribute :description,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :external_id,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :fuel_type,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :last_known_position,
                  on:         :read,
                  type:       :object,
                  class_name: 'VehiclePosition'

        attribute :license_plate,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :manufacturer,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :model,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :nickname,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :operator_id,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :string

        attribute :phone_number,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :vehicle_type,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :version,
                  on:   [:read, :update],
                  type: :integer
      end
    end
  end
end
