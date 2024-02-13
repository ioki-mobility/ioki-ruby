# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ResourceConfiguration < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :bicycle_racks,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :child_booster_seat,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :child_safety_seat,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :default,
                  on:   :read,
                  type: :boolean

        attribute :hand_luggage_storage_spaces,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :medical_seats,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :name,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :pet_transportation_bays,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :power_plugs,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :resource_1,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :resource_2,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :resource_3,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :resource_4,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :resource_5,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :seats,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :special_seats,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :storage_spaces,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :suitcase_storage_spaces,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :walker_bays,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :walker_storage_spaces,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :wheelchair_bays,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :wheelchair_storage_spaces,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :wlan_access_points,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer
      end
    end
  end
end
