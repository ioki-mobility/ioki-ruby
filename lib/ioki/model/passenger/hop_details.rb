# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class HopDetails < Base
        unvalidated true

        attribute :direction, on: :read, type: :string
        attribute :name, on: :read, type: :string
        attribute :transport_type, on: :read, type: :string
      end
    end
  end
end
