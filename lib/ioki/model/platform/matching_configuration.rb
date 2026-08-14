# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class MatchingConfiguration < Base
        attribute :drt_sub_area_id, type: :string, on: [:create, :read, :update]
        attribute :time_window_collapse_threshold, type: :integer, on: [:create, :read, :update]
        attribute :streak_split_buffer_threshold, type: :integer, on: [:create, :read, :update]
        attribute :ride_distance_min, type: :integer, on: [:create, :read, :update]
        attribute :prevent_station_to_station_matching, type: :boolean, on: [:create, :read, :update]
        attribute :prevent_address_to_address_matching, type: :boolean, on: [:create, :read, :update]
        attribute :penalty_per_passenger_walking_second, type: :number, on: [:create, :read, :update]
        attribute :penalty_per_passenger_waiting_second, type: :number, on: [:create, :read, :update]
        attribute :penalty_per_empty_duration, type: :number, on: [:create, :read, :update]
        attribute :penalty_per_driving_second, type: :number, on: [:create, :read, :update]
        attribute :penalty_per_driving_duration, type: :number, on: [:create, :read, :update]
        attribute :penalty_per_delay_second, type: :number, on: [:create, :read, :update]
        attribute :penalty_per_cost_benefit_ratio, type: :number, on: [:create, :read, :update]
        attribute :penalty_per_additional_empty_duration, type: :number, on: [:create, :read, :update]
        attribute :penalty_per_additional_driving_duration, type: :number, on: [:create, :read, :update]
        attribute :minimum_detour_duration, type: :integer, on: [:create, :read, :update]
        attribute :maximum_detour_duration, type: :integer, on: [:create, :read, :update]
        attribute :max_walking_duration_dropoff, type: :integer, on: [:create, :read, :update]
        attribute :max_walking_duration_pickup, type: :integer, on: [:create, :read, :update]
        attribute :max_walking_duration, type: :integer, on: [:create, :read, :update]
        attribute :max_request_time_deviation, type: :integer, on: [:create, :read, :update]
        attribute :matching_mode_pickup, type: :string, on: [:create, :read, :update]
        attribute :matching_mode_dropoff, type: :string, on: [:create, :read, :update]
        attribute :matching_max_enclosed_tasks, type: :integer, on: [:create, :read, :update]
        attribute :matching_considered_stations, type: :integer, on: [:create, :read, :update]
        attribute :gain_per_ride_duration, type: :number, on: [:create, :read, :update]
        attribute :gain_per_passenger_second, type: :number, on: [:create, :read, :update]
        attribute :gain_per_passenger_duration, type: :number, on: [:create, :read, :update]
        attribute :gain_per_passenger_direct_routing_duration, type: :number, on: [:create, :read, :update]
        attribute :gain_per_loaded_duration, type: :number, on: [:create, :read, :update]
        attribute :gain_per_additional_ride_duration, type: :number, on: [:create, :read, :update]
        attribute :gain_per_additional_passenger_duration, type: :number, on: [:create, :read, :update]
        attribute :gain_per_additional_passenger_direct_routing_duration, type: :number, on: [:create, :read, :update]
        attribute :gain_per_additional_loaded_duration, type: :number, on: [:create, :read, :update]
        attribute :detour_duration_factor, type: :number, on: [:create, :read, :update]
        attribute :description, type: :string, on: [:create, :read, :update]
        attribute :version, type: :integer, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :area, on: :read, type: :object, class_name: 'GeoJson'
        attribute :name, on: :read, type: :string
        attribute :slug, on: :read, type: :string
      end
    end
  end
end
