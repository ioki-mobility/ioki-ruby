# frozen_string_literal: true

require 'ioki/model/driver/prebooking_threshold'
require 'ioki/model/driver/passenger_options'

module Ioki
  module Model
    module Driver
      class RideOption < Base
        unvalidated true # Specification not available.

        attribute :book_for_others, on: :read, type: :boolean
        attribute :destination_time_based_matching, on: :read, type: :boolean
        attribute :max_wheelchairs, on: :read, type: :integer
        attribute :max_walkers, on: :read, type: :integer
        attribute :prebooking_threshold, on: :read, type: :object, model_class: PrebookingThreshold
        attribute :passengers, on: :read, type: :object, model_class: PassengerOptions
      end
    end
  end
end
