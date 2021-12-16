# frozen_string_literal: true

require 'ioki/model/passenger/vehicle'

module Ioki
  module Model
    module Passenger
      class Driver < Base
        attribute :connected_vehicle_id, on: :read, type: :string
        attribute :display_name, on: :read, type: :string
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
