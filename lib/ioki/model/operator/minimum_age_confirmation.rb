# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class MinimumAgeConfirmation < Base
        attribute :minimum_age,
                  type: :integer,
                  on:   :read
      end
    end
  end
end
