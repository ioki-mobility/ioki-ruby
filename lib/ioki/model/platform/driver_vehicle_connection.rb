# frozen_string_literal: true

require 'ioki/model/platform/vehicle'
require 'ioki/model/platform/driver'

module Ioki
  module Model
    module Platform
      class DriverVehicleConnection < Ioki::Model::Base
        attribute :id, on: [:update, :read], type: :string
        attribute :vehicle, on: :read, type: :object, model_class: Ioki::Model::Platform::Vehicle
        attribute :driver, on: :read, type: :object, model_class: Ioki::Model::Platform::Driver
        attribute :activated_at, on: :read, type: :date_time
        attribute :deactivated_at, on: [:create, :read], type: :date_time, omit_if_blank_on: :create
      end
    end
  end
end
