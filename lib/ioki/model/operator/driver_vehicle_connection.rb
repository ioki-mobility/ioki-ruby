# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class DriverVehicleConnection < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: [:update, :read], type: :string
        attribute :vehicle, on: :read, type: :object, class_name: 'Vehicle'
        attribute :driver, on: :read, type: :object, class_name: 'Driver'
        attribute :activated_at, on: :read, type: :date_time
        attribute :deactivated_at, on: [:create, :read], type: :date_time, omit_if_blank_on: :create
      end
    end
  end
end
