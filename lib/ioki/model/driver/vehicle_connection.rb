# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class VehicleConnection < Base
        unvalidated true # Specification not available.

        attribute :license_plate, on: :create, type: :string
      end
    end
  end
end
