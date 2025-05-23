# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class PassengerTypes < Base
        unvalidated true # Specification not available.

        attribute :type, on: :read, type: :string
      end
    end
  end
end
