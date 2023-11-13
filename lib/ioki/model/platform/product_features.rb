# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class ProductFeatures < Base
        unvalidated true # Specification not available

        attribute :supports_multiple_booking_solutions, type: :boolean, on: :read
      end
    end
  end
end
