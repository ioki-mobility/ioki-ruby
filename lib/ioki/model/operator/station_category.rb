# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class StationCategory < Base
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

        attribute :color,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :slug,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :title,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :string
      end
    end
  end
end
