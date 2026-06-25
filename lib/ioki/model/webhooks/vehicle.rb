# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Vehicle < Base
        attribute :wheelchair_bays, type: :integer, on: [:create, :read, :update]
        attribute :walker_bays, type: :integer, on: [:create, :read, :update]
        attribute :storage_spaces, type: :integer, on: [:create, :read, :update]
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :autonomous, type: :boolean
        attribute :description, type: :string
        attribute :external_id, type: :string
        attribute :fuel_type, type: :string
        attribute :license_plate, type: :string
        attribute :manufacturer, type: :string
        attribute :model, type: :string
        attribute :nickname, type: :string
        attribute :phone_number, type: :string
        attribute :product_id, type: :string
        attribute :seats, type: :integer
        attribute :connected_driver, type: :object, class_name: 'NestedDriver'
        attribute :last_known_position, type: :object, class_name: 'VehiclePositionWithoutVehicle'
      end
    end
  end
end
