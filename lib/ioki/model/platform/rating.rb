# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Rating < Base
        attribute :rating_line_items, type: :array, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :comment, on: [:read, :create, :update], type: :string
        deprecated_attribute :driver_rating, on: [:read, :create, :update], type: :integer
        attribute :editable, on: :read, type: :boolean
        deprecated_attribute :punctuality_rating, on: [:read, :create, :update], type: :integer
        deprecated_attribute :ride_rating, on: [:read, :create, :update], type: :integer
        attribute :ride_version, on: [:create, :update], type: :integer, unvalidated: true
        deprecated_attribute :service_rating, on: [:read, :create, :update], type: :integer
        deprecated_attribute :vehicle_cleanliness_rating, on: [:read, :create, :update], type: :integer
        deprecated_attribute :vehicle_rating, on: [:read, :create, :update], type: :integer
        attribute :version, on: [:read, :update], type: :integer
        deprecated_attribute :waiting_time_rating, on: [:read, :create, :update], type: :integer
      end
    end
  end
end
