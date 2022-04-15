# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class TaskList < Base
        attribute :actual_ends_at, on: :read, type: :date_time
        attribute :actual_starts_at, on: :read, type: :date_time
        attribute :ad_hoc_bookable, on: [:read, :create], type: :boolean
        attribute :deactivated, on: :read, type: :boolean
        attribute :deactivations, on: :read, type: :array, class_name: 'Deactivation'
        attribute :driver, on: :read, type: :object, class_name: 'Driver'
        attribute :ends_at, on: :create, type: :date_time
        attribute :end_place, on: :read, type: :object, class_name: 'Place'
        attribute :matching_configuration_id, on: :create, type: :string
        attribute :matching_configuration, on: :read, type: :object, class_name: 'MatchingConfiguration'
        attribute :end_place_id, on: :create, type: :object, class_name: 'Place'
        attribute :paused, on: :read, type: :boolean
        attribute :pauses, on: [:read, :create], type: :array, class_name: 'Pause'
        attribute :planned_ends_at, on: :read, type: :date_time
        attribute :planned_starts_at, on: :read, type: :date_time
        attribute :prebookable, on: [:read, :create], type: :boolean
        attribute :product_id, on: :read, type: :string
        attribute :starts_at, on: :create, type: :date_time
        attribute :start_place, on: :read, type: :object, class_name: 'Place'
        attribute :start_place_id, on: :create, type: :object, class_name: 'Place'
        attribute :state, on: [:read, :create], type: :string
        attribute :tasks, on: :read, type: :array, class_name: 'Task'
        attribute :vehicle, on: :read, type: :object, class_name: 'Vehicle'
        attribute :vehicle_id, on: :create, type: :object, class_name: 'Vehicle'
      end
    end
  end
end
