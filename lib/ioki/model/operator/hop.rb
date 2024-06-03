# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Hop < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :duration,
                  on:   :read,
                  type: :integer

        attribute :track,
                  on:   :read,
                  type: :string

        attribute :transport_mode,
                  on:   :read,
                  type: :string

        attribute :from,
                  on:         :read,
                  type:       :object,
                  class_name: ['CalculatedPoint', 'RequestedPoint', 'PublicTransportStop']

        attribute :to,
                  on:         :read,
                  type:       :object,
                  class_name: ['CalculatedPoint', 'RequestedPoint', 'PublicTransportStop']

        attribute :vehicle,
                  on:         :read,
                  type:       :object,
                  class_name: 'Vehicle'

        attribute :details,
                  on:         :read,
                  type:       :object,
                  class_name: 'HopDetails'
      end
    end
  end
end
