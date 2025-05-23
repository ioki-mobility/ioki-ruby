# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class LegacyRideOptions < Base
        unvalidated true # Specification not available.

        attribute :book_for_others, on: :read, type: :boolean
        attribute :destination_time_based_matching, on: :read, type: :boolean
        attribute :max_wheelchairs, on: :read, type: :integer
        attribute :max_walkers, on: :read, type: :integer
        attribute :prebooking_threshold, on: :read, type: :object, class_name: 'PrebookingThreshold'
        attribute :passengers, on: :read, type: :object, class_name: 'PassengerOptions'
      end
    end
  end
end
