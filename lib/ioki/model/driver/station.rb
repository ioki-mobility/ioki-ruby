# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Station < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :active, on: :read, type: :boolean
        attribute :city, on: :read, type: :string
        attribute :country, on: :read, type: :string
        attribute :county, on: :read, type: :string
        attribute :description, on: :read, type: :string
        attribute :fixed, on: :read, type: :boolean
        attribute :formatted_street, on: :read, type: :string
        attribute :lat, on: :read, type: :float
        attribute :lng, on: :read, type: :float
        attribute :location_name, on: :read, type: :string
        attribute :postal_code, on: :read, type: :string
        attribute :street_name, on: :read, type: :string
        attribute :street_number, on: :read, type: :string
        attribute :transport_connections_url, on: :read, type: :string
        attribute :transport_station_types, on: :read, type: :array
        attribute :avatar, on: :read, type: :object, class_name: 'ImageUpload'
      end
    end
  end
end
