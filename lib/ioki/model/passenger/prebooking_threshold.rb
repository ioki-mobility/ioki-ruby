# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PrebookingThreshold < Base
        unvalidated true # Specification not available.

        attribute :min, on: :read, type: :integer
        attribute :max, on: :read, type: :integer
      end
    end
  end
end
