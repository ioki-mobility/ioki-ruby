# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Route < Base
        unvalidated true # No specification available

        attribute :track, type: :string, on: :read
      end
    end
  end
end
