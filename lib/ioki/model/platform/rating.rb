# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Rating < Base
        attribute :comment, on: [:read, :create, :update], type: :string
        attribute :driver_rating, on: [:read, :create, :update], type: :integer
        attribute :editable, on: :read, type: :boolean
        attribute :punctuality_rating, on: [:read, :create, :update], type: :integer
        attribute :ride_rating, on: [:read, :create, :update], type: :integer
        attribute :ride_version, on: [:create, :update], type: :integer
        attribute :service_rating, on: [:read, :create, :update], type: :integer
        attribute :vehicle_cleanliness_rating, on: [:read, :create, :update], type: :integer
        attribute :vehicle_rating, on: [:read, :create, :update], type: :integer
        attribute :version, on: [:read, :update], type: :integer
        attribute :waiting_time_rating, on: [:read, :create, :update], type: :integer
      end
    end
  end
end
