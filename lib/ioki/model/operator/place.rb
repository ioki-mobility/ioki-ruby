# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Place < Base
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
                  on:   [:create, :read, :update],
                  type: :string

        attribute :country,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :county,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :depot,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :boolean

        attribute :description,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :lat,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :float

        attribute :lng,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :float

        attribute :location_name,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :postal_code,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :slug,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :street_name,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :street_number,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :waiting_position,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :boolean

        attribute :version,
                  on:             [:read, :update],
                  omit_if_nil_on: [:update],
                  type:           :integer
      end
    end
  end
end
