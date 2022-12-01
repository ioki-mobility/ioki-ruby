# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Operator < Base
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

        attribute :archived_at,
                  on:   :read,
                  type: :date_time

        attribute :default_operator,
                  on:   :read,
                  type: :boolean

        attribute :name,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :slug,
                  on:   [:create, :read, :update],
                  type: :string
      end
    end
  end
end
