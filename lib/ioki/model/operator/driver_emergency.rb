# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class DriverEmergency < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :acknowledged_at, on: :read, type: :date_time
        attribute :driver, on: [:create, :read], type: :object, class_name: 'Driver'
        attribute :vehicle, on: [:create, :read], type: :object, class_name: 'Vehicle'
      end
    end
  end
end
