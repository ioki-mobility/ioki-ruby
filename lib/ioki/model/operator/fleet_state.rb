# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class FleetState < Base
        attribute :operator_id, type: :string, on: [:create, :read, :update]
        attribute :product_id, type: :string, on: [:create, :read, :update]
        attribute :vehicle_ids, type: :string, on: [:create, :read, :update]
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :limit_reached,
                  on:   :read,
                  type: :boolean

        attribute :vehicles,
                  on:         :read,
                  type:       :array,
                  class_name: 'Vehicle'
      end
    end
  end
end
