# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Hop < Base
        def self.schema_path
          # passenger_api--hop
          # passenger_api--hop--drt_hop
          # passenger_api--hop--public_transport_hop
          # passenger_api--hop--walking_hop

          # Only public transport schema includes all attributes:
          'passenger_api--hop--public_transport_hop'
        end

        attribute :type, on: :read, type: :string
        attribute :duration, on: :read, type: :integer
        attribute :track, on: :read, type: :string
        attribute :transport_mode, on: :read, type: :string
        attribute :from, on: :read, type: :object,
          class_name: ['CalculatedPoint', 'RequestedPoint', 'PublicTransportStop']
        attribute :to, on: :read, type: :object,
          class_name: ['CalculatedPoint', 'RequestedPoint', 'PublicTransportStop']
        attribute :vehicle, on: :read, type: :object, class_name: 'Vehicle'
        attribute :details, on: :read, type: :object, class_name: 'HopDetails'
      end
    end
  end
end
