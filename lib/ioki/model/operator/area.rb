# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Area < Base
        attribute :name,
                  type:           :string,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update]

        attribute :slug,
                  type:           :string,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update]

        attribute :area_type,
                  type:           :string,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update]

        attribute :description,
                  type: :string,
                  on:   [:create, :read, :update]

        attribute :color,
                  type:           :string,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update]

        attribute :area,
                  on:         :read,
                  type:       :object,
                  class_name: 'Geojson'

        attribute :inverted_area,
                  on:         :read,
                  type:       :object,
                  class_name: 'Geojson'

        attribute :area_geojson,
                  on:   [:create, :update],
                  type: :string

        attribute :product_id,
                  type:           :string,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update]
      end
    end
  end
end
