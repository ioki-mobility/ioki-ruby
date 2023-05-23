# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Vehicle < Base
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

        attribute :autonomous,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :boolean

        attribute :connected_driver_id,
                  on:   :read,
                  type: :string

        attribute :description,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :external_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :fuel_type,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :image,
                  on:         :read,
                  type:       :object,
                  class_name: 'ImageUpload'

        attribute :last_known_position,
                  on:         :read,
                  type:       :object,
                  class_name: 'VehiclePosition'

        attribute :license_plate,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :manufacturer,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :model,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :nickname,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :num_wheelchair_bays_as_storages,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :operator_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :phone_number,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :seats,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :storage_spaces,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :walker_bays,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :wheelchair_bays,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :version,
                  on:             [:update, :read],
                  omit_if_nil_on: [:update],
                  type:           :integer
      end
    end
  end
end
