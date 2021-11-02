# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Rating < Base
        attribute :version, type: :integer, on: :read
        attribute :vehicle_rating, type: :integer, on: :read
        attribute :service_rating, type: :integer, on: :read
        attribute :driver_rating, type: :integer, on: :read
        attribute :ride_rating, type: :integer, on: :read
        attribute :waiting_time_rating, type: :integer, on: :read
        attribute :punctuality_rating, type: :integer, on: :read
        attribute :comment, type: :string, on: :read
      end
    end
  end
end
