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
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :boolean

        attribute :auto_repositioning_strategy,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :deactivated,
                  on:   :read,
                  type: :boolean

        attribute :deactivations,
                  on:         :read,
                  type:       :array,
                  class_name: 'Deactivation'

        attribute :end_location,
                  on:         :read,
                  type:       :object,
                  class_name: %w[Place Station]

        attribute :end_location_id,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :end_location_type,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :ends_at,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :date_time

        attribute :last_connected_driver_id,
                  on:   :read,
                  type: :string

        attribute :matching_configuration_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :matching_configuration_name,
                  on:   :read,
                  type: :string

        attribute :matching_rank,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :num_prebooked_rides,
                  on:   :read,
                  type: :integer

        attribute :paused,
                  on:   :read,
                  type: :boolean

        attribute :pauses,
                  on:             [:read, :create],
                  omit_if_nil_on: [:create],
                  type:           :array,
                  class_name:     'Pause'

        attribute :planned_ends_at,
                  on:   :read,
                  type: :date_time

        attribute :planned_starts_at,
                  on:   :read,
                  type: :date_time

        attribute :prebookable,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :boolean

        attribute :service_ends_at,
                  on:   [:create, :read, :update],
                  type: :date_time

        attribute :service_starts_at,
                  on:   [:create, :read, :update],
                  type: :date_time

        attribute :start_location,
                  on:         :read,
                  type:       :object,
                  class_name: %w[Place Station]

        attribute :start_location_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :start_location_type,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :starts_at,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :date_time

        attribute :state,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :vehicle,
                  on:             :read,
                  omit_if_nil_on: [:read],
                  type:           :object,
                  class_name:     'Vehicle'

        attribute :vehicle_id,
                  on:             [:create, :read, :reassign],
                  omit_if_nil_on: [:create, :reassign],
                  type:           :string

        attribute :line_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create],
                  type:           :string

        attribute :line_name,
                  on:   :read,
                  type: :string

        attribute :driver_name,
                  on:   :read,
                  type: :string

        attribute :custom_tags,
                  on:         [:create, :read, :update],
                  type:       :array,
                  class_name: 'CustomTag'

        attribute :version,
                  on:             [:read, :update],
                  omit_if_nil_on: [:update],
                  type:           :integer
      end
    end
  end
end
