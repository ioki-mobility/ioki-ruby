# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class MinimumAgeConfirmation < Base
        unvalidated true # No specification available.

        attribute :minimum_age, on: :read, type: :integer
      end
    end
  end
end
