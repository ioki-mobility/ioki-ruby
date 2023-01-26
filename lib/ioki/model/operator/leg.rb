# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Leg < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :destination_task_calculated_time,
                  on:   :read,
                  type: :string

        attribute :destination_task_waypoint_type,
                  on:   :read,
                  type: :string

        attribute :distance,
                  on:   :read,
                  type: :integer

        attribute :duration,
                  on:   :read,
                  type: :integer

        attribute :geo_track,
                  on:   :read,
                  type: :string

        attribute :geo_track_durations,
                  on:   :read,
                  type: :array

        attribute :leg_order,
                  on:   :read,
                  type: :integer

        attribute :maneuvers,
                  on:   :read,
                  type: :array

        attribute :maneuvers_calculated_at,
                  on:   :read,
                  type: :date_time

        attribute :destination_task,
                  on:         :read,
                  type:       :object,
                  class_name: 'Task'
      end
    end
  end
end
