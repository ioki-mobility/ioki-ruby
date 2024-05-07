# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Telemetry < Base
        attribute :id,
                  on:   :read,
                  type: :string

        attribute :battery_level,
                  on:   :read,
                  type: :float

        attribute :remaining_distance,
                  on:   :read,
                  type: :float

        attribute :charging_state,
                  on:   :read,
                  type: :string

        attribute :estimated_time_until_full_recharge,
                  on:   :read,
                  type: :float

        attribute :last_synced_at,
                  on:   :read,
                  type: :date_time
      end
    end
  end
end
