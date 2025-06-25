# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Area < Base
        attribute :bounding_box, type: :object, on: [:create, :read, :update], class_name: 'BoundingBox'
        attribute :legend_description_translations, type: :object, on: [:create, :read, :update], class_name: 'MultilanguageString'
        attribute :legend_title_translations, type: :object, on: [:create, :read, :update], class_name: 'MultilanguageString'
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :name, on: [:read, :update], type: :string
        attribute :slug, on: [:read, :update], type: :string
        attribute :area_type, on: [:read, :create], type: :string
        attribute :description, on: [:read, :update], type: :string
        attribute :color, on: [:read, :update], type: :string
        attribute :opacity, on: :read, type: :float
        attribute :stroke_weight, on: :read, type: :integer
        attribute :fill_color, on: :read, type: :string
        attribute :fill_opacity, on: :read, type: :float
        attribute :invert, on: :read, type: :boolean
        attribute :z_index, on: :read, type: :integer
        attribute :legend_index, on: :read, type: :integer
        attribute :legend_title, on: :read, type: :string
        attribute :legend_description, on: :read, type: :string
        attribute :product_id, on: :read, type: :string
        attribute :area_geojson, on: [:read, :update], type: :object, class_name: 'GeoJson'
      end
    end
  end
end
