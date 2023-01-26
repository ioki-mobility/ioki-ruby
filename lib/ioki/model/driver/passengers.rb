# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Passengers < Base
        unvalidated true # Specification not available.

        attribute :ride_version, on: :create, type: :integer
        attribute :fare_version, on: :create, type: :integer
        attribute :passengers, on: :create, type: :array, class_name: 'Passenger'
      end
    end
  end
end
