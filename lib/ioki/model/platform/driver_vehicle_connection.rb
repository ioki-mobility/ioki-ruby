# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class DriverVehicleConnection < Base
        attribute :activated_at, on: :read, type: :date_time
        attribute :deactivated_at, on: [:create, :read], type: :date_time, omit_if_blank_on: :create
        attribute :driver, on: :read, type: :object, class_name: 'Driver'
        attribute :driver_id, on: [:create], type: :string, unvalidated: true
        attribute :id, on: [:update, :read], type: :string
        attribute :type, on: :read, type: :string
        attribute :vehicle, on: :read, type: :object, class_name: 'Vehicle'
        attribute :vehicle_id, on: [:create], type: :string, unvalidated: true
      end
    end
  end
end
