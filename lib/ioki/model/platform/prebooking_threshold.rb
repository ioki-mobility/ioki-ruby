# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class PrebookingThreshold < Base
        unvalidated true # Specification not available.

        attribute :min, on: :read, type: :integer
        attribute :max, on: :read, type: :integer
      end
    end
  end
end
