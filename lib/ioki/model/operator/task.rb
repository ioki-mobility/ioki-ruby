# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Task < Base
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

        attribute :acceptable,
                  on:   :read,
                  type: :boolean

        attribute :accepted_at,
                  on:   :read,
                  type: :date_time

        attribute :calculated_point,
                  on:         :read,
                  type:       :object,
                  class_name: 'CalculatedPoint'

        attribute :calculated_point_id,
                  on:   :read,
                  type: :string

        attribute :cancellable,
                  on:   :read,
                  type: :boolean

        attribute :cancelled_at,
                  on:   :read,
                  type: :date_time

        attribute :completable,
                  on:   :read,
                  type: :boolean

        attribute :completed_at,
                  on:   :read,
                  type: :date_time

        attribute :completer_id,
                  on:   :read,
                  type: :string

        attribute :completer_type,
                  on:   :read,
                  type: :string

        attribute :pause_id,
                  on:   :read,
                  type: :string

        attribute :rejectable,
                  on:   :read,
                  type: :boolean

        attribute :ride_id,
                  on:   :read,
                  type: :string

        attribute :state,
                  on:   :read,
                  type: :string

        attribute :task_list_id,
                  on:   :read,
                  type: :string

        attribute :waypoint_type,
                  on:   :read,
                  type: :string
      end
    end
  end
end
