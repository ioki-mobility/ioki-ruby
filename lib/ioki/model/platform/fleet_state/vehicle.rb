# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class FleetState < Base
        # A vehicle as the fleet state lists it, which differs from an Ioki::Model::Platform::Vehicle: it has the
        # product_id, for instance
        class Vehicle < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :id,
                    on:   :read,
                    type: :string

          attribute :active,
                    on:   :read,
                    type: :boolean

          attribute :autonomous,
                    on:   :read,
                    type: :boolean

          attribute :fuel_type,
                    on:   :read,
                    type: :string

          attribute :license_plate,
                    on:   :read,
                    type: :string

          attribute :manufacturer,
                    on:   :read,
                    type: :string

          attribute :model,
                    on:   :read,
                    type: :string

          attribute :nickname,
                    on:   :read,
                    type: :string

          attribute :description,
                    on:   :read,
                    type: :string

          attribute :last_position,
                    on:         :read,
                    type:       :object,
                    class_name: 'Ioki::Model::Platform::VehiclePosition'

          attribute :last_known_position,
                    on:         :read,
                    type:       :object,
                    class_name: 'Ioki::Model::Platform::VehiclePosition'

          attribute :telemetry,
                    on:         :read,
                    type:       :object,
                    class_name: 'Ioki::Model::Platform::Telemetry'

          attribute :product_id,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
