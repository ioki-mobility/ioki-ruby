# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RestrictedArea < Base
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

        attribute :area_geojson,
                  on:         [:create, :read],
                  type:       :object,
                  class_name: 'Geojson'

        attribute :bounding_box,
                  on:         :read,
                  type:       :object,
                  class_name: 'BoundingBox'

        attribute :ends_at,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :date_time

        attribute :name,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :string

        attribute :starts_at,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :date_time

        attribute :state,
                  on:   :read,
                  type: :string
      end
    end
  end
end
