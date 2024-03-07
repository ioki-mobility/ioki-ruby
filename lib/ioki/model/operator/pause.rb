# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Pause < Base
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

        attribute :actual_ends_at,
                  on:   :read,
                  type: :date_time

        attribute :actual_starts_at,
                  on:   :read,
                  type: :date_time

        attribute :ends_at,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:read, :update],
                  type:           :date_time

        attribute :place,
                  on:         :read,
                  type:       :object,
                  class_name: 'Place'

        attribute :place_id,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :planned_ends_at,
                  on:   :read,
                  type: :date_time

        attribute :planned_starts_at,
                  on:   :read,
                  type: :date_time

        attribute :preserve_duration,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :read, :update],
                  type:           :boolean

        attribute :starts_at,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:read, :update],
                  type:           :date_time

        attribute :version,
                  on:             [:update, :read],
                  omit_if_nil_on: [:update],
                  type:           :integer
      end
    end
  end
end
