# frozen_string_literal: true

require 'ioki/model/platform/vehicle'
require 'ioki/model/platform/driver'

module Ioki
  module Model
    module Platform
      class DriverVehicleConnection < Ioki::Model::Base
        # Note that this does not inherit from Ioki::Model::Platform::Base because created_at and updated_at are not defined.

        def self.specification_scope
          'platform_api--v20210101'
        end

        attribute :type, on: :read, type: :string
        attribute :id, on: [:update, :read], type: :string
        attribute :vehicle, on: :read, type: :object, model_class: Ioki::Model::Platform::Vehicle
        attribute :driver, on: :read, type: :object, model_class: Ioki::Model::Platform::Driver
        attribute :activated_at, on: :read, type: :date_time
        attribute :deactivated_at, on: [:create, :read], type: :date_time, omit_if_blank_on: :create
      end
    end
  end
end
