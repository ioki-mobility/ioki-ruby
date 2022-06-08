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

        attribute :lat,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :lng,
                  on:   [:create, :read, :update],
                  type: :float

        attribute :location_name,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :postal_code,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :product_id,
                  on:   :read,
                  type: :string

        attribute :street_name,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :street_number,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :description,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :slug,
                  on:   [:create, :read, :update],
                  type: :string
      end
    end
  end
end
