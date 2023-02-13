# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Station < Base
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

        attribute :active,
                  on:   :read,
                  type: :boolean

        attribute :boarding_time,
                  on:   [:read, :create, :update],
                  type: :integer

        attribute :city,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :country,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :county,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :deactivations,
                  on:         :read,
                  type:       :array,
                  class_name: 'Deactivation'

        attribute :description,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :dhid,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :external_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :fixed,
                  on:   :read,
                  type: :boolean

        attribute :lat,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :float

        attribute :lng,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :float

        attribute :location_name,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :parking_time,
                  on:   [:read, :create, :update],
                  type: :integer

        attribute :postal_code,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :station_category_id,
                  on:   [:create, :update, :read],
                  type: :string

        attribute :station_type,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :street_name,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :street_number,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :tariff_codes,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :array

        attribute :walker_boarding_time,
                  on:   [:read, :create, :update],
                  type: :integer

        attribute :wheelchair_boarding_time,
                  on:   [:read, :create, :update],
                  type: :integer
      end
    end
  end
end
