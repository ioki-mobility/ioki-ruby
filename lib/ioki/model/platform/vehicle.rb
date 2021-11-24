# frozen_string_literal: true

require 'ioki/model/platform/vehicle_position'

module Ioki
  module Model
    module Platform
      class Vehicle < Base
        attribute :connected_driver_id, on: :read, type: :string
        attribute :fuel_type,           on: :read, type: :string
        attribute :license_plate,       on: :read, type: :string
        attribute :manufacturer,        on: :read, type: :string
        attribute :model,               on: :read, type: :string
        attribute :nickname,            on: :read, type: :string
        attribute :seats,               on: :read, type: :integer
        attribute :storage_spaces,      on: :read, type: :integer
        attribute :walker_bays,         on: :read, type: :integer
        attribute :wheelchair_bays,     on: :read, type: :integer

        attribute :autonomous, on: :read, type: :boolean
        attribute :description, on: :read, type: :string
        attribute :external_id, on: :read, type: :string
        attribute :last_known_position, on: :read, type: :object, model_class: VehiclePosition
        attribute :phone_number, on: :read, type: :string
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
