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
                  on:   :read,
                  type: :boolean

        attribute :deactivated,
                  on:   :read,
                  type: :boolean

        attribute :end_place,
                  on:         :read,
                  type:       :object,
                  class_name: 'Place'

        attribute :end_location,
                  on:   :read,
                  type: :object

        # attribute :matching_configuration,
        #           on:         :read,
        #           type:       :object,
        #           class_name: 'MatchingConfiguration'

        attribute :paused,
                  on:   :read,
                  type: :boolean

        attribute :planned_ends_at,
                  on:   :read,
                  type: :date_time

        attribute :planned_starts_at,
                  on:   :read,
                  type: :date_time

        attribute :prebookable,
                  on:   :read,
                  type: :boolean

        attribute :start_location,
                  on:   :read,
                  type: :object

        attribute :start_place,
                  on:         :read,
                  type:       :object,
                  class_name: 'Place'

        attribute :state,
                  on:   :read,
                  type: :string

        attribute :vehicle,
                  on:         :read,
                  type:       :object,
                  class_name: 'Vehicle'
      end
    end
  end
end
