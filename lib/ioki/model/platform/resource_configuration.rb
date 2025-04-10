# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class ResourceConfiguration < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time

        attribute :name, on: :read, type: :string
        attribute :default, on: :read, type: :boolean

        attribute :seats, on: :read, type: :integer
        attribute :medical_seats, on: :read, type: :integer
        attribute :special_seats, on: :read, type: :integer
        attribute :child_booster_seat, on: :read, type: :integer
        attribute :child_safety_seat, on: :read, type: :integer
        attribute :wheelchair_bays, on: :read, type: :integer
        attribute :wheelchair_storage_spaces, on: :read, type: :integer
        attribute :walker_bays, on: :read, type: :integer
        attribute :walker_storage_spaces, on: :read, type: :integer
        attribute :suitcase_storage_spaces, on: :read, type: :integer
        attribute :hand_luggage_storage_spaces, on: :read, type: :integer
        attribute :bicycle_racks, on: :read, type: :integer
        attribute :pet_transportation_bays, on: :read, type: :integer
        attribute :storage_spaces, on: :read, type: :integer
        attribute :power_plugs, on: :read, type: :integer
        attribute :wlan_access_points, on: :read, type: :integer
        attribute :resource_1, on: :read, type: :integer
        attribute :resource_2, on: :read, type: :integer
        attribute :resource_3, on: :read, type: :integer
        attribute :resource_4, on: :read, type: :integer
        attribute :resource_5, on: :read, type: :integer
      end
    end
  end
end
