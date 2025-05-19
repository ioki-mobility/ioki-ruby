# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class CustomFlag < Base
        attribute :name,
                  on:   :read,
                  type: :string

        attribute :slug,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :value,
                  on:   [:create, :read, :update],
                  type: :boolean
      end
    end
  end
end
