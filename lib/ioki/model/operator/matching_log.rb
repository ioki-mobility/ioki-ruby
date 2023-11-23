# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class MatchingLog < Base
        attribute :dt,
                  on:   :read,
                  type: :integer

        attribute :log_level,
                  on:   :read,
                  type: :integer

        attribute :message,
                  on:   :read,
                  type: :string
      end
    end
  end
end
