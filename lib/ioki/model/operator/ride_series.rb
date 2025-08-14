# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RideSeries < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time

        attribute :base_ride_id, on: :read, type: :string
        attribute :additional_dates, on: [:read, :create], type: :array
        attribute :processing_started_at, on: :read, type: :date_time
        attribute :processing_finished_at, on: :read, type: :date_time
        attribute :rides, on: :read, type: :array, class_name: 'Ride'
        attribute :results, on: :read, type: :array, class_name: 'RideSeriesResultItem'
      end
    end
  end
end
