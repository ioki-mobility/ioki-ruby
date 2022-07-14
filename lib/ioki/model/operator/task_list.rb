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
                  on:         [:create, :read, :update],
                  type:       :object,
                  class_name: %w[Place Station]

        attribute :end_place,
                  on:         [:create, :read, :update],
                  type:       :object,
                  class_name: 'Place'

        # attribute :matching_configuration,
        #           on:         :read,
        #           type:       :object,
        #           class_name: 'MatchingConfiguration'

        attribute :paused,
                  on:   :read,
                  type: :boolean

        attribute :planned_ends_at,
                  on:   [:create, :read, :update],
                  type: :date_time

        attribute :planned_starts_at,
                  on:   [:create, :read, :update],
                  type: :date_time

        attribute :prebookable,
                  on:   [:create, :read, :update],
                  type: :boolean

        attribute :start_location,
                  on:         [:create, :read, :update],
                  type:       :object,
                  class_name: %w[Place Station]

        attribute :start_place,
                  on:         [:create, :read, :update],
                  type:       :object,
                  class_name: 'Place'

        attribute :state,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :state_options,
                  on:   :read,
                  type: :array

        attribute :vehicle,
                  on:         [:create, :read],
                  type:       :object,
                  class_name: 'Vehicle'
      end
    end
  end
end
