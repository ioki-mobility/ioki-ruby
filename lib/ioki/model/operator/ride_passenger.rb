# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RidePassenger < Base
        attribute :options, type: :array, on: [:create, :read, :update]
        deprecated_attribute :bahncard,
                             on:   :read,
                             type: :boolean

        deprecated_attribute :blue_badge,
                             on:   :read,
                             type: :boolean

        deprecated_attribute :public_transport_ticket,
                             on:   :read,
                             type: :boolean

        attribute :type,
                  on:   :read,
                  type: :string

        deprecated_attribute :walker,
                             on:   :read,
                             type: :boolean

        deprecated_attribute :wheelchair,
                             on:   :read,
                             type: :boolean
      end
    end
  end
end
