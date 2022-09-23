# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RidePassenger < Base
        attribute :bahncard,
                  on:   :read,
                  type: :boolean

        attribute :blue_badge,
                  on:   :read,
                  type: :boolean

        attribute :public_transport_ticket,
                  on:   :read,
                  type: :boolean

        attribute :type,
                  on:   :read,
                  type: :string

        attribute :walker,
                  on:   :read,
                  type: :boolean

        attribute :wheelchair,
                  on:   :read,
                  type: :boolean
      end
    end
  end
end
