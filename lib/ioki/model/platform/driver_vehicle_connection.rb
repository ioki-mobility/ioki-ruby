# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class DriverVehicleConnection < Ioki::Model::Base
        # Note that this does not inherit from Base because created_at and updated_at are not defined.

        def self.specification_scope
          'platform_api--v20210101'
        end

        attribute :activated_at, on: :read, type: :date_time
        attribute :deactivated_at, on: [:create, :read], type: :date_time, omit_if_blank_on: :create
        attribute :driver, on: :read, type: :object, class_name: 'Driver'
        attribute :driver_id, on: [:create], type: :string
        attribute :id, on: [:update, :read], type: :string
        attribute :type, on: :read, type: :string
        attribute :vehicle, on: :read, type: :object, class_name: 'Vehicle'
        attribute :vehicle_id, on: [:create], type: :string
      end
    end
  end
end
