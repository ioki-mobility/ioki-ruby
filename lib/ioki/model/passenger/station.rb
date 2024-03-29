# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Station < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :location_name, on: [:read, :update, :create], type: :string
        attribute :lat,           on: [:read, :update, :create], type: :float
        attribute :lng,           on: [:read, :update, :create], type: :float
        attribute :city,          on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :country,       on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :county,        on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :description,   on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :postal_code,   on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :street_name,   on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :street_number, on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :active, on: :read, type: :boolean
        attribute :avatar, on: :read, type: :object, class_name: 'ImageUpload'
        attribute :fixed, on: :read, type: :boolean
        attribute :formatted_street, on: :read, type: :string
        attribute :transport_connections_url, on: :read, type: :string
        attribute :transport_station_types, on: :read, type: :array
      end
    end
  end
end
