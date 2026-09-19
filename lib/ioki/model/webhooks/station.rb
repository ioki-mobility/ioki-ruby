# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Station < Base
        attribute :product_id, type: :string, on: [:create, :read, :update]
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :active, type: :boolean
        attribute :city, type: :string
        attribute :country, type: :string
        attribute :county, type: :string
        attribute :description, type: :string
        attribute :external_id, type: :string
        attribute :lat, type: :float
        attribute :lng, type: :float
        attribute :location_name, type: :string
        attribute :postal_code, type: :string
        attribute :station_type, type: :string
        attribute :street_name, type: :string
        attribute :street_number, type: :string
        attribute :deactivations, type: :array, class_name: 'Deactivation'
      end
    end
  end
end
