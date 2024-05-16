# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class MatchingConfiguration < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :area,
                  on:         :read,
                  type:       :object,
                  class_name: 'Geojson'

        attribute :drt_sub_area_id,
                  on:   [:create, :update],
                  type: :string

        attribute :description,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :detour_duration_factor,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :gain_per_additional_loaded_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :gain_per_additional_passenger_direct_routing_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :gain_per_additional_passenger_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :gain_per_additional_ride_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :gain_per_loaded_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :gain_per_passenger_direct_routing_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :gain_per_passenger_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :gain_per_passenger_second,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :gain_per_ride_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :matching_considered_stations,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :matching_max_enclosed_tasks,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :matching_mode_dropoff,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :matching_mode_pickup,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :max_request_time_deviation,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :max_walking_duration,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :max_walking_duration_dropoff,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :max_walking_duration_pickup,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :maximum_detour_duration,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :minimum_detour_duration,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :name,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :penalty_per_additional_driving_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :penalty_per_additional_empty_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :penalty_per_cost_benefit_ratio,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :penalty_per_delay_second,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :penalty_per_driving_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :penalty_per_driving_second,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :penalty_per_empty_duration,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :penalty_per_passenger_waiting_second,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :penalty_per_passenger_walking_second,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :prevent_address_to_address_matching,
                  on:   [:create, :read, :update],
                  type: :boolean

        attribute :prevent_station_to_station_matching,
                  on:   [:create, :read, :update],
                  type: :boolean

        attribute :ride_distance_min,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :slug,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :streak_split_buffer_threshold,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :time_window_collapse_threshold,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :version,
                  on:             [:update, :read],
                  omit_if_nil_on: [:update],
                  type:           :integer
      end
    end
  end
end
