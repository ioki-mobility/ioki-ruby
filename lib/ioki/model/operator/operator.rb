# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Operator < Base
        attribute :vat_number, type: :string, on: [:create, :read, :update]
        attribute :external_id, type: :string, on: [:create, :read, :update]
        attribute :address, type: :string, on: [:create, :read, :update]
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

        # attribute :archived_at,
        #           on:   :read,
        #           type: :date_time

        attribute :default_operator,
                  on:   :read,
                  type: :boolean

        attribute :matching_rank,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :integer

        attribute :provider_id,
                  on:   :create,
                  type: :string

        attribute :name,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :slug,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :locale,
                  on:             [:create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string
      end
    end
  end
end
