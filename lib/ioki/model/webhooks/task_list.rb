# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class TaskList < Base
        attribute :start_location, type: :object, on: [:create, :read, :update], class_name: ['Place', 'Station']
        attribute :end_location, type: :object, on: [:create, :read, :update], class_name: ['Place', 'Station']
        attribute :service_starts_at, type: :string, on: [:create, :read, :update]
        attribute :service_ends_at, type: :string, on: [:create, :read, :update]
        attribute :line_id, type: :string, on: [:create, :read, :update]
        attribute :current, type: :boolean, on: [:create, :read, :update]
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :actual_ends_at, type: :date_time
        attribute :actual_starts_at, type: :date_time
        attribute :deactivated, type: :boolean
        attribute :planned_ends_at, type: :date_time
        attribute :planned_starts_at, type: :date_time
        attribute :product_id, type: :string
        attribute :state, type: :string
        attribute :current_journey, type: :object, class_name: 'Journey'
        attribute :deactivations, type: :array, class_name: 'Deactivation'
        attribute :driver, type: :object, class_name: 'Driver'
        deprecated_attribute :end_place, type: :object, class_name: 'Place'
        attribute :pauses, type: :array, class_name: 'Pause'
        deprecated_attribute :start_place, type: :object, class_name: 'Place'
        attribute :tasks, type: :array, class_name: 'Task'
        attribute :vehicle, type: :object, class_name: 'Vehicle'
      end
    end
  end
end
