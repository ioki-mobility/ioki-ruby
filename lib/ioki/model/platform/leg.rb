# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Leg < Base
        attribute :destination_task, type: :object, on: :read, class_name: 'Task'
        attribute :destination_task_calculated_time, type: :string, on: :read
        attribute :destination_task_waypoint_type, type: :string, on: :read
        attribute :distance, type: :integer, on: :read
        attribute :duration, type: :integer, on: :read
        attribute :geo_track, type: :string, on: :read
        attribute :geo_track_durations, type: :array, on: :read
        attribute :leg_order, type: :integer, on: :read
        attribute :maneuvers, type: :array, on: :read
        attribute :maneuvers_calculated_at, type: :date_time, on: :read
      end
    end
  end
end
