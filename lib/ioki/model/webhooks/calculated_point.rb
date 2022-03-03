# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class CalculatedPoint < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :city, type: :string
        attribute :display_times, type: :array
        attribute :lat, type: :float
        attribute :lng, type: :float
        attribute :location_name, type: :string
        attribute :pause_id, type: :string
        attribute :postal_code, type: :string
        attribute :station_id, type: :string
        attribute :street_name, type: :string
        attribute :street_number, type: :string
        attribute :waypoint_type, type: :string
      end
    end
  end
end
