# frozen_string_literal: true

require 'ioki/model/platform/vehicle'
require 'ioki/model/platform/driver'

module Ioki
  module Model
    module Platform
      class DriverEmergency < Base
        attribute :acknowledged_at, on: :read, type: :date_time
        attribute :driver, on: [:create, :read], type: :object, model_class: Driver
        attribute :vehicle, on: [:create, :read], type: :object, model_class: Vehicle
      end
    end
  end
end
