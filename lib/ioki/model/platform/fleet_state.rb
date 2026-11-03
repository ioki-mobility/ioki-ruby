# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class FleetState < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :limit_reached,
                  on:   :read,
                  type: :boolean

        attribute :vehicles,
                  on:         :read,
                  type:       :array,
                  class_name: 'Ioki::Model::Platform::FleetState::Vehicle'

        # Filters of the request, passed as query parameters, e.g. `fleet_state(params: { vehicle_ids: ... })`
        attribute :vehicle_ids,
                  on:   :create,
                  type: :string

        attribute :product_id,
                  on:   :create,
                  type: :string

        attribute :operator_id,
                  on:   :create,
                  type: :string
      end
    end
  end
end
