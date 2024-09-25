# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RecurrenceRule < Base
        attribute :day_of_week,
                  on:   [:read, :update],
                  type: :integer

        attribute :valid_from_offset,
                  on:   [:read, :update],
                  type: :integer

        attribute :valid_until_offset,
                  on:   [:read, :update],
                  type: :integer
      end
    end
  end
end
