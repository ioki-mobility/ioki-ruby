# frozen_string_literal: true

require 'ioki/model/platform/passenger_options'
require 'ioki/model/platform/prebooking_threshold'

module Ioki
  module Model
    module Platform
      class RideOptions < Base
        unvalidated true # Specification not available.

        attribute :book_for_others, on: :read, type: :boolean
        attribute :destination_time_based_matching, on: :read, type: :boolean
        attribute :max_wheelchairs, on: :read, type: :integer
        attribute :max_walkers, on: :read, type: :integer
        attribute :prebooking_threshold, on: :read, type: :object, model_class: Ioki::Model::Platform::PrebookingThreshold
        attribute :passengers, on: :read, type: :object, model_class: Ioki::Model::Platform::PassengerOptions
      end
    end
  end
end
