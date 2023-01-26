# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class VehiclePositionWithoutVehicle < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :accuracy, type: :float
        attribute :altitude, type: :float
        attribute :altitude_accuracy, type: :float
        attribute :heading, type: :float
        attribute :lat, type: :float
        attribute :lng, type: :float
        attribute :product_id, type: :string
        attribute :recorded_at, type: :date_time
        attribute :speed, type: :float
      end
    end
  end
end
