# frozen_string_literal: true

require 'ioki/model/platform/vehicle'
require 'ioki/model/platform/driver'

module Ioki
  module Model
    module Platform
      class DriverEmergency < Base
        attribute :acknowledged_at, on: :read, type: :string
        attribute :driver, on: [:create, :read], type: :object, model_class: Ioki::Model::Platform::Driver
        attribute :vehicle, on: [:create, :read], type: :object, model_class: Ioki::Model::Platform::Vehicle
      end
    end
  end
end
