# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class CancellationStatement < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :identifier, on: :read, type: :string
        attribute :title, on: :read, type: :string
        attribute :suitable_for_ride_series, on: :read, type: :boolean
        attribute :suitable_for_single_rides, on: :read, type: :boolean
      end
    end
  end
end
