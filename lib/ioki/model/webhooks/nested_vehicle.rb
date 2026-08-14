# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class NestedVehicle < Base
        attribute :wheelchair_bays, type: :integer, on: [:create, :read, :update]
        attribute :walker_bays, type: :integer, on: [:create, :read, :update]
        attribute :storage_spaces, type: :integer, on: [:create, :read, :update]
        attribute :phone_number, type: :string, on: [:create, :read, :update]
        attribute :external_id, type: :string, on: [:create, :read, :update]
        attribute :description, type: :string, on: [:create, :read, :update]
        attribute :autonomous, type: :boolean, on: [:create, :read, :update]
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :fuel_type, type: :string
        attribute :license_plate, type: :string
        attribute :manufacturer, type: :string
        attribute :model, type: :string
        attribute :nickname, type: :string
        attribute :product_id, type: :string
        attribute :seats, type: :integer
      end
    end
  end
end
