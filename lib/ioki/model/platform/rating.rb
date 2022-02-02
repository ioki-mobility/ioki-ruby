# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Rating < Base
        attribute :version, on: :read, type: :integer
        attribute :vehicle_rating, on: [:read, :create], type: :integer
        attribute :service_rating, on: [:read, :create], type: :integer
        attribute :driver_rating, on: [:read, :create], type: :integer
        attribute :ride_rating, on: [:read, :create], type: :integer
        attribute :waiting_time_rating, on: [:read, :create], type: :integer
        attribute :punctuality_rating, on: [:read, :create], type: :integer
        attribute :comment, on: [:read, :create], type: :string
        attribute :editable, on: :read, type: :boolean
        attribute :ride_version, on: :create, type: :integer
      end
    end
  end
end
