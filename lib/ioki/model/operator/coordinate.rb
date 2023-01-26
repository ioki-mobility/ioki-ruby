# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Coordinate < Base
        unvalidated true # No specification available.

        attribute :lat, on: :read, type: :float
        attribute :lng, on: :read, type: :float
      end
    end
  end
end
