# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class TaskList < Base
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

        attribute :actual_ends_at,
                  on:   :read,
                  type: :date_time

        attribute :actual_starts_at,
                  on:   :read,
                  type: :date_time

        attribute :ad_hoc_bookable,
                  on:   [:create, :read, :update],
                  type: :boolean

        attribute :deactivated,
                  on:   :read,
                  type: :boolean

        attribute :end_location,
                  on:         :read,
                  type:       :object,
                  class_name: %w[Place Station]

        attribute :end_location_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: :read,
                  type:           :string

        attribute :end_location_type,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: :read,
                  type:           :string

        attribute :ends_at,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: :read,
                  type:           :date_time

        attribute :matching_configuration_id,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :paused,
                  on:   :read,
                  type: :boolean

        attribute :pauses,
                  on: [:read, :create],
                  omit_if_blank_on: [:create],
                  type: :array,
                  class_name: 'Pause'

        attribute :planned_ends_at,
                  on:   :read,
                  type: :date_time

        attribute :planned_starts_at,
                  on:   :read,
                  type: :date_time

        attribute :prebookable,
                  on:   [:create, :read, :update],
                  type: :boolean

        attribute :start_location,
                  on:         :read,
                  type:       :object,
                  class_name: %w[Place Station]

        attribute :start_location_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: :read,
                  type:           :string

        attribute :start_location_type,
                  on:               [:create, :read, :update],
                  omit_if_blank_on: :read,
                  type:             :string

        attribute :starts_at,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: :read,
                  type:           :date_time

        attribute :state,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :state_options,
                  on:   :read,
                  type: :array

        attribute :vehicle_id,
                  on:   [:create, :read, :reassign],
                  type: :string
      end
    end
  end
end
