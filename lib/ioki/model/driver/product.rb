# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Product < Base
        attribute :name, on: :read, type: :string
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :auto_accept_by_driver_client, on: :read, type: :boolean
        attribute :driver_client_can_reject_task, on: :read, type: :boolean
        attribute :driver_emergency_phone_number, on: :read, type: :string
        attribute :driver_faq_url, on: :read, type: :string
        attribute :drivers_can_pause, on: :read, type: :boolean
        attribute :supports_driver_emergency_button, on: :read, type: :boolean
        attribute :supports_tipping, on: :read, type: :boolean
        attribute :cancellation_statements, on: :read, type: :array, class_name: 'CancellationStatement'
        attribute :ride_options, on: :read, type: :object, class_name: 'RideOptions'
      end
    end
  end
end
