# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class UserAutocomplete < Base
        attribute :id,
                  on:   :read,
                  type: :string

        attribute :fullname,
                  on:   :read,
                  type: :string

        attribute :phone_number,
                  on:   :read,
                  type: :string

        attribute :unique_customer_id,
                  on:   :read,
                  type: :string

        attribute :locked,
                  on:   :read,
                  type: :boolean
      end
    end
  end
end
