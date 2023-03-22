# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Driver < Base
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

        attribute :connected_vehicle_id,
                  on:   :read,
                  type: :string

        attribute :display_name,
                  on:   :read,
                  type: :string

        attribute :external_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :first_name,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :last_name,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :locale,
                  on:               [:create, :read, :update],
                  omit_if_nil_on:   [:create, :update],
                  omit_if_blank_on: [:create, :update],
                  type:             :string

        attribute :locked_at,
                  on:   :read,
                  type: :date_time

        attribute :password,
                  on:   :read,
                  type: :string

        attribute :phone_number,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :username,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :version,
                  on:   [:update, :read],
                  type: :integer
      end
    end
  end
end
