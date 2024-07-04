# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Zone < Base
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
                  on:         [:create, :read, :update],
                  type:       :object,
                  class_name: 'Geojson'

        attribute :name,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :slug,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string
      end
    end
  end
end
