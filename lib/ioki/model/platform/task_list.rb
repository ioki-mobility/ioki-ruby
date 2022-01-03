# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class TaskList < Base
        attribute :actual_ends_at, on: :read, type: :date_time
        attribute :actual_starts_at, on: :read, type: :date_time
        attribute :ad_hoc_bookable, on: :read, type: :boolean
        attribute :deactivated, on: :read, type: :boolean
        attribute :deactivations, on: :read, type: :array, class_name: 'Deactivation'
        attribute :driver, on: :read, type: :object, class_name: 'Driver'
        attribute :end_place, on: :read, type: :object, class_name: 'Place'
        attribute :matching_configuration, on: :read, type: :object, class_name: 'MatchingConfiguration'
        attribute :paused, on: :read, type: :boolean
        attribute :pauses, on: :read, type: :array, class_name: 'Pause'
        attribute :planned_ends_at, on: :read, type: :date_time
        attribute :planned_starts_at, on: :read, type: :date_time
        attribute :prebookable, on: :read, type: :boolean
        attribute :product_id, on: :read, type: :string
        attribute :start_place, on: :read, type: :object, class_name: 'Place'
        attribute :state, on: :read, type: :string
        attribute :tasks, on: :read, type: :array, class_name: 'Task'
        attribute :vehicle, on: :read, type: :object, class_name: 'Vehicle'
      end
    end
  end
end
