# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Venue < Base
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

        attribute :city,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :country,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :county,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :formatted_street,
                  on:   :read,
                  type: :string

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

        attribute :postal_code,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :street_name,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :street_number,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :venue_type,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string
      end
    end
  end
end
