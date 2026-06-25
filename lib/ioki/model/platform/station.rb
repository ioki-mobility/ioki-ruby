# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Station < Base
        attribute :parking_time, type: :integer, on: [:create, :read, :update]
        attribute :walker_boarding_time, type: :integer, on: [:create, :read, :update]
        attribute :wheelchair_boarding_time, type: :integer, on: [:create, :read, :update]
        attribute :boarding_time, type: :integer, on: [:create, :read, :update]
        attribute :station_category_id, type: :string, on: [:create, :read, :update]
        attribute :announcements, type: :array, on: [:create, :read, :update]
        attribute :tariff_codes, type: :array, on: [:create, :read, :update]
        attribute :station_category, type: :object, on: [:create, :read, :update], class_name: 'NestedStationCategory'
        attribute :visible_on_map_in_passenger_client, type: :boolean, on: [:create, :read, :update]
        attribute :product_id, type: :string, on: [:create, :read, :update]
        attribute :municipality, type: :string, on: [:create, :read, :update]
        attribute :dhid, type: :string, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :active, on: :read, type: :boolean
        attribute :city,          on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :country,       on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :county,        on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :deactivations, on: :read, type: :array, class_name: 'Deactivation'
        attribute :description,   on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :external_id,   on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :lat,           on: [:read, :create, :update], type: :float
        attribute :lng,           on: [:read, :create, :update], type: :float
        attribute :location_name, on: [:read, :create, :update], type: :string
        attribute :postal_code,   on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :station_type,  on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :street_name,   on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :street_number, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
      end
    end
  end
end
