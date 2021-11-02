# frozen_string_literal: true

require 'ioki/model/platform/station'

module Ioki
  module Model
    module Platform
      class CalculatedPoint < Base
        attribute :city,                 on: :read, type: :string
        attribute :country,              on: :read, type: :string
        attribute :county,               on: :read, type: :string
        attribute :display_times,        on: :read, type: :array
        attribute :formatted_street,     on: :read, type: :string
        attribute :lat,                  on: :read, type: :float
        attribute :lng,                  on: :read, type: :float
        attribute :location_name,        on: :read, type: :string
        attribute :postal_code,          on: :read, type: :string
        attribute :street_name,          on: :read, type: :string
        attribute :street_number,        on: :read, type: :string
        attribute :station_id,           on: :read, type: :string
        attribute :time,                 on: :read, type: :date_time
        attribute :negotiation_time,     on: :read, type: :date_time
        attribute :negotiation_time_max, on: :read, type: :date_time
        attribute :waypoint_type,        on: :read, type: :string
        attribute :walking_duration,     on: :read, type: :integer
        attribute :walking_track,        on: :read, type: :string
        attribute :station,              on: :read, type: :object, model_class: Ioki::Model::Platform::Station
      end
    end
  end
end
