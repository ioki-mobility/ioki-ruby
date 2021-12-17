# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Task < Base
        attribute :acceptable, on: :read, type: :boolean
        attribute :accepted_at, on: :read, type: :date_time
        attribute :calculated_point, on: :read, type: :object, class_name: 'CalculatedPoint'
        attribute :cancellable, on: :read, type: :boolean
        attribute :cancelled_at, on: :read, type: :date_time
        attribute :completable, on: :read, type: :boolean
        attribute :completed_at, on: :read, type: :date_time
        # The model_class is omitted because it can have one of several types.
        attribute :completer, on: :read, type: :object
        attribute :completer_id, on: :read, type: :string
        attribute :completer_type, on: :read, type: :string
        attribute :pause, on: :read, type: :object, class_name: 'Pause'
        attribute :rejectable, on: :read, type: :boolean
        attribute :ride, on: :read, type: :object, class_name: 'Ride'
        attribute :state, on: :read, type: :string
        attribute :task_list_id, on: :read, type: :string
        attribute :waypoint_type, on: :read, type: :string
      end
    end
  end
end
