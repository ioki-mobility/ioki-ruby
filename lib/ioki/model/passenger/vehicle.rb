# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Vehicle < Base
        attribute :fuel_type,           type: :string, on: :read
        attribute :license_plate,       type: :string, on: :read
        attribute :manufacturer,        type: :string, on: :read
        attribute :model,               type: :string, on: :read
        attribute :nickname,            type: :string, on: :read
        attribute :seats,               type: :integer, on: :read
        attribute :storage_spaces,      type: :integer, on: :read
        attribute :walker_bays,         type: :integer, on: :read
        attribute :wheelchair_bays,     type: :integer, on: :read
      end
    end
  end
end
