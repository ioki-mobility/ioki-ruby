# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class ProductFeatures < Base
        unvalidated true # Specification not available

        deprecated_attribute :supports_multiple_booking_solutions,
                             type:        :boolean,
                             on:          :read,
                             replaced_by: :multiple_booking_solutions
        attribute :multiple_booking_solutions, type: :boolean, on: :read
        attribute :station_search, type: :boolean, on: :read
      end
    end
  end
end
