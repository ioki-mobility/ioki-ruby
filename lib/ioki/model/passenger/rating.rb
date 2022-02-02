# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Rating < Base
        attribute :version, on: :read, type: :integer
        attribute :comment, on: [:read, :create], type: :string
        attribute :driver_rating, on: [:read, :create], type: :integer
        attribute :editable, on: :read, type: :boolean
        attribute :punctuality_rating, on: [:read, :create], type: :integer
        attribute :ride_rating, on: [:read, :create], type: :integer
        attribute :service_rating, on: [:read, :create], type: :integer
        attribute :vehicle_rating, on: [:read, :create], type: :integer
        attribute :waiting_time_rating, on: [:read, :create], type: :integer
        attribute :ride_version, on: :create, type: :integer
      end
    end
  end
end
