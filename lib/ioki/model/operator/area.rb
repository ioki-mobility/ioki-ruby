# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Area < Base
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

        attribute :name,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :slug,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :area_type,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :description,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :color,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :opacity,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :float

        attribute :stroke_weight,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :fill_color,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :fill_opacity,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :float

        attribute :invert,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :boolean

        attribute :z_index,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :legend_index,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :legend_title,
                  on:   :read,
                  type: :string

        attribute :legend_description,
                  on:   :read,
                  type: :string

        attribute :legend_title_translations,
                  on:         :read,
                  type:       :object,
                  class_name: 'MultilanguageString'

        attribute :legend_description_translations,
                  on:         :read,
                  type:       :object,
                  class_name: 'MultilanguageString'

        attribute :bounding_box,
                  on:         :read,
                  type:       :object,
                  class_name: 'BoundingBox'

        attribute :area_geojson,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :object,
                  class_name:     'Geojson'
      end
    end
  end
end
