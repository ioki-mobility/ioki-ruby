# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class MinimumAgeConfirmation < Base
        attribute :minimum_age,
                  on:   :read,
                  type: :integer
      end
    end
  end
end
