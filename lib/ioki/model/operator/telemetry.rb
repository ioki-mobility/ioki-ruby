# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Telemetry < Base
        attribute :id,
                  on:   :read,
                  type: :string

        attribute :altitude,
                  on:   :read,
                  type: :float

        attribute :altitude_source,
                  on:   :read,
                  type: :string

        attribute :altitude_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :battery_level,
                  on:   :read,
                  type: :float

        attribute :battery_level_source,
                  on:   :read,
                  type: :string

        attribute :battery_level_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :charging_state,
                  on:   :read,
                  type: :string

        attribute :charging_state_source,
                  on:   :read,
                  type: :string

        attribute :charging_state_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :door_state,
                  on:   :read,
                  type: :string

        attribute :door_state_source,
                  on:   :read,
                  type: :string

        attribute :door_state_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :estimated_time_until_full_recharge,
                  on:   :read,
                  type: :float

        attribute :estimated_time_until_full_recharge_source,
                  on:   :read,
                  type: :string

        attribute :estimated_time_until_full_recharge_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :heading,
                  on:   :read,
                  type: :float

        attribute :heading_source,
                  on:   :read,
                  type: :string

        attribute :heading_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :lat,
                  on:   :read,
                  type: :float

        attribute :lat_source,
                  on:   :read,
                  type: :string

        attribute :lat_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :lng,
                  on:   :read,
                  type: :float

        attribute :lng_source,
                  on:   :read,
                  type: :string

        attribute :lng_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :mobileye_mission_state,
                  on:   :read,
                  type: :string

        attribute :mobileye_mission_state_source,
                  on:   :read,
                  type: :string

        attribute :mobileye_mission_state_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :mobileye_sds_state,
                  on:   :read,
                  type: :string

        attribute :mobileye_sds_state_source,
                  on:   :read,
                  type: :string

        attribute :mobileye_sds_state_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :people_count,
                  on:   :read,
                  type: :integer

        attribute :people_count_source,
                  on:   :read,
                  type: :string

        attribute :people_count_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :remaining_distance,
                  on:   :read,
                  type: :float

        attribute :remaining_distance_source,
                  on:   :read,
                  type: :string

        attribute :remaining_distance_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :speed,
                  on:   :read,
                  type: :float

        attribute :speed_source,
                  on:   :read,
                  type: :string

        attribute :speed_synced_at,
                  on:   :read,
                  type: :date_time

        attribute :tires_pressure,
                  on:   :read,
                  type: :array

        attribute :tires_pressure_source,
                  on:   :read,
                  type: :string

        attribute :tires_pressure_synced_at,
                  on:   :read,
                  type: :date_time
      end
    end
  end
end
