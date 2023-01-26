# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Route < Base
        unvalidated true # Specification not available

        attribute :track, type: :string, on: :read
      end
    end
  end
end
