# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Leg < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :destination_task_calculated_time, type: :date_time
        attribute :destination_task_waypoint_type, type: :string
        attribute :distance, type: :integer
        attribute :duration, type: :integer
        attribute :geo_track, type: :string
        attribute :geo_track_durations, type: :array
        attribute :leg_order, type: :integer
        attribute :maneuvers, type: :array
        attribute :maneuvers_calculated_at, type: :date_time
        attribute :destination_task, type: :object, class_name: 'Task'
      end
    end
  end
end
