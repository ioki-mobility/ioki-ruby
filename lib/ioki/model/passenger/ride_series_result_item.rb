# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class RideSeriesResultItem < Base
        def self.schema_path
          'passenger_api--v1--ride_series--result_item'
        end

        attribute :type, on: :read, type: :string
        attribute :ride_date, on: :read, type: :date_time
        attribute :processed, on: :read, type: :boolean
        attribute :ride_id, on: :read, type: :string
        attribute :ride_create_success, on: :read, type: :boolean
        attribute :ride_create_error_code, on: :read, type: :string
        attribute :ride_state_after_matching, on: :read, type: :string
        attribute :booking_success, on: :read, type: :boolean
        attribute :booking_error_code, on: :read, type: :string
      end
    end
  end
end
