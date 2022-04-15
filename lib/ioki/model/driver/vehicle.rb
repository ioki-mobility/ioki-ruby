# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Vehicle < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :version, on: :read, type: :integer
        attribute :active_task_list_id, on: :read, type: :string
        attribute :deactivatable, on: :read, type: :boolean
        attribute :deactivate_driver_app_position_updates, on: :read, type: :boolean
        attribute :fuel_type, on: :read, type: :string
        attribute :license_plate, on: :read, type: :string
        attribute :manufacturer, on: :read, type: :string
        attribute :model, on: :read, type: :string
        attribute :nickname, on: :read, type: :string
        attribute :operator_information, on: :read, type: :string
        attribute :seats, on: :read, type: :integer
        attribute :show_odometer_modal, on: :read, type: :boolean
        attribute :storage_spaces, on: :read, type: :integer
        attribute :walker_bays, on: :read, type: :integer
        attribute :wheelchair_bays, on: :read, type: :integer
        attribute :thingsboard_access_token, on: :read, type: :string
        attribute :avatar, on: :read, type: :object, class_name: 'ImageUpload'
        attribute :deactivations, on: :read, type: :array, class_name: 'Deactivation'
      end
    end
  end
end
