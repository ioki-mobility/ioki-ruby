# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Vehicle < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :fuel_type, on: :read, type: :string
        attribute :license_plate, on: :read, type: :string
        attribute :manufacturer, on: :read, type: :string
        attribute :model, on: :read, type: :string
        attribute :nickname, on: :read, type: :string
        attribute :seats, on: :read, type: :integer
        attribute :storage_spaces, on: :read, type: :integer
        attribute :walker_bays, on: :read, type: :integer
        attribute :wheelchair_bays, on: :read, type: :integer
        attribute :avatar, on: :read, type: :object, class_name: 'ImageUpload'
        attribute :operator_information, on: :read, type: :string
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
