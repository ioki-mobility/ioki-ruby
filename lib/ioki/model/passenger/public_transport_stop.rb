# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PublicTransportStop < Base
        attribute :type, on: :read, type: :string
        attribute :city, type: :string, on: :read
        attribute :country, type: :string, on: :read
        attribute :county, type: :string, on: :read
        attribute :current_arrival, type: :string, on: :read
        attribute :current_departure, type: :string, on: :read
        attribute :current_platform, type: :string, on: :read
        attribute :dhid, type: :string, on: :read
        attribute :display_times, type: :array, on: :read
        attribute :hafas_ext_id, type: :array, on: :read
        attribute :lat, type: :float, on: :read
        attribute :lng, type: :float, on: :read
        attribute :location_name, type: :array, on: :read
        attribute :postal_code, type: :array, on: :read
        attribute :scheduled_arrival, type: :string, on: :read
        attribute :scheduled_departure, type: :string, on: :read
        attribute :scheduled_platform, type: :string, on: :read
        attribute :street_name, type: :string, on: :read
        attribute :street_number, type: :string, on: :read
      end
    end
  end
end
