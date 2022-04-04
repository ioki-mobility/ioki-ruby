# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class RequestedPoint < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :city, on: :read, type: :string
        attribute :country, on: :read, type: :string
        attribute :county, on: :read, type: :string
        attribute :display_times, on: :read, type: :array
        attribute :formatted_street, on: :read, type: :string
        attribute :lat, on: :read, type: :float
        attribute :lng, on: :read, type: :float
        attribute :location_name, on: :read, type: :string
        attribute :postal_code, on: :read, type: :string
        attribute :station_id, on: :read, type: :string
        attribute :street_name, on: :read, type: :string
        attribute :street_number, on: :read, type: :string
        attribute :time, on: :read, type: :date_time
        attribute :waypoint_type, on: :read, type: :string
      end
    end
  end
end
