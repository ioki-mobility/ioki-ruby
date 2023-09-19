# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class UserAutocomplete < Base
        attribute :value,
                  on:   :read,
                  type: :string

        attribute :label,
                  on:   :read,
                  type: :string

        attribute :locked,
                  on:   :read,
                  type: :boolean
      end
    end
  end
end
