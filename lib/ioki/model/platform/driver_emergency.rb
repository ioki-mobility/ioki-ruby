# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class DriverEmergency < Base
        attribute :acknowledged_at, on: :read, type: :date_time
        attribute :driver, on: [:create, :read], type: :object, class_name: 'Driver'
        attribute :vehicle, on: [:create, :read], type: :object, class_name: 'Vehicle'
      end
    end
  end
end
