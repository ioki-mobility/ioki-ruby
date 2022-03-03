# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class TaskList < Base
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
        attribute :deactivations, type: :array
        attribute :driver, type: :object, class_name: 'Driver'
        attribute :end_place, type: :object, class_name: 'Place'
        attribute :pauses, type: :array
        attribute :start_place, type: :object, class_name: 'Place'
        attribute :tasks, type: :array
        attribute :vehicle, type: :object, class_name: 'Vehicle'
      end
    end
  end
end
