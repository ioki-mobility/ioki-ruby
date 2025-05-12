# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Product < Base
        attribute :product_ride_options, type: :array, on: [:create, :read, :update]
        attribute :passenger_types, type: :array, on: [:create, :read, :update]
        attribute :passenger_options, type: :array, on: [:create, :read, :update]
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :version, type: :integer
        attribute :description, type: :string
        attribute :name, type: :string
        attribute :provider_id, type: :string
        deprecated_attribute :ride_options, type: :object
        attribute :service_time_info, type: :string
        attribute :bounding_box, type: :object, class_name: 'BoundingBox'
      end
    end
  end
end
