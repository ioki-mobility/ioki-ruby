# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class VehicleState < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :limit_reached,
                  on:   :read,
                  type: :boolean

        attribute :vehicles,
                  on:         :read,
                  type:       :array,
                  class_name: 'VehicleStates::Vehicle'

        attribute :resource_configurations,
                  on:         :read,
                  type:       :array,
                  class_name: 'VehicleStates::ResourceConfiguration'
      end
    end
  end
end
