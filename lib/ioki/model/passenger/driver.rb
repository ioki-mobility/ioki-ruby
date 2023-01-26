# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Driver < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :connected_vehicle_id, on: :read, type: :string
        attribute :display_name, on: :read, type: :string
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
