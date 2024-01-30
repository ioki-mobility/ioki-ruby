# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ResourceConfiguration < Base
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

        attribute :default,
                  on:   :read,
                  type: :boolean

        attribute :name,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :seats,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :storage_spaces,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :walker_bays,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :wheelchair_bays,
                  on:             [:create, :update, :read],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer
      end
    end
  end
end
