# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class VehiclePosition < Base
        unvalidated true # Specification not available.

        attribute :lat, on: :create, type: :float
        attribute :lng, on: :create, type: :float
        attribute :recorded_at, on: :create, type: :date_time
        attribute :accuracy, on: :create, type: :float
        attribute :speed, on: :create, type: :float
        attribute :heading, on: :create, type: :float
        attribute :altitude_accuracy, on: :create, type: :float
        attribute :altitude, on: :create, type: :float
        attribute :source, on: :create, type: :string
        attribute :on_route, on: :create, type: :boolean
      end
    end
  end
end
