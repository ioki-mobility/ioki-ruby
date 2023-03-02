# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class TaskList < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :actual_ends_at, on: :read, type: :date_time
        attribute :actual_starts_at, on: :read, type: :date_time
        attribute :ad_hoc_bookable, on: [:read, :create, :update], type: :boolean
        attribute :deactivated, on: :read, type: :boolean
        attribute :deactivations, on: :read, type: :array, class_name: 'Deactivation'
        attribute :driver, on: :read, type: :object, class_name: 'Driver'
        attribute :ends_at, on: [:create, :update], type: :date_time, unvalidated: true
        attribute :end_place, on: :read, type: :object, class_name: 'Place'
        attribute :end_place_id, on: [:create, :update], type: :object, class_name: 'Place', unvalidated: true
        attribute :matching_configuration_id, on: :read, type: :string
        attribute :matching_configuration_id, on: [:create, :update], type: :string, unvalidated: true
        attribute :paused, on: :read, type: :boolean
        attribute :pauses, on: [:read, :create], omit_if_blank_on: [:create], type: :array, class_name: 'Pause'
        attribute :planned_ends_at, on: :read, type: :date_time
        attribute :planned_starts_at, on: :read, type: :date_time
        attribute :prebookable, on: [:read, :create], type: :boolean
        attribute :product_id, on: :read, type: :string
        attribute :starts_at, on: [:create, :update], type: :date_time, unvalidated: true
        attribute :start_place, on: :read, type: :object, class_name: 'Place'
        attribute :start_place_id, on: [:create, :update], type: :object, class_name: 'Place', unvalidated: true
        attribute :state, on: [:read, :create], type: :string
        attribute :tasks, on: :read, type: :array, class_name: 'Task'
        attribute :vehicle, on: :read, type: :object, class_name: 'Vehicle'
        attribute :vehicle_id, on: [:create, :update], type: :object, class_name: 'Vehicle', unvalidated: true
      end
    end
  end
end
