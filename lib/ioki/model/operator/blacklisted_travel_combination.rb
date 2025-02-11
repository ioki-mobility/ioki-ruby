# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class BlacklistedTravelCombination < Base
        attribute :id,
                  on:   :read,
                  type: :string

        attribute :type,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :destination,
                  on:   :read,
                  type: :string

        attribute :destination_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :destination_type,
                  on:             [:create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :has_recurrence_rules,
                  on:   :read,
                  type: :boolean

        attribute :name,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :origin,
                  on:   :read,
                  type: :string

        attribute :origin_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :origin_type,
                  on:             [:create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :recurrence_rules,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :array,
                  class_name:     'RecurrenceRule'
      end
    end
  end
end
