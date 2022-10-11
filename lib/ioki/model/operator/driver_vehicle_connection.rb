# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class DriverVehicleConnection < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :activated_at,
                  on:   :read,
                  type: :date_time

        attribute :deactivated_at,
                  on:   :read,
                  type: :date_time

        attribute :driver,
                  on:         :read,
                  type:       :object,
                  class_name: 'Driver'

        attribute :driver_id,
                  on:   [:create, :read],
                  type: :string

        attribute :vehicle,
                  on:         :read,
                  type:       :object,
                  class_name: 'Vehicle'

        attribute :vehicle_id,
                  on:   [:create, :read],
                  type: :string
      end
    end
  end
end
