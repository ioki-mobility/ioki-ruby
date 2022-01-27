# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Rating < Base
        attribute :version, on: :read, type: :integer
        attribute :vehicle_rating, on: :read, type: :integer
        attribute :service_rating, on: :read, type: :integer
        attribute :driver_rating, on: :read, type: :integer
        attribute :ride_rating, on: :read, type: :integer
        attribute :waiting_time_rating, on: :read, type: :integer
        attribute :punctuality_rating, on: :read, type: :integer
        attribute :comment, on: :read, type: :string
        attribute :editable, on: :read, type: :boolean
      end
    end
  end
end
