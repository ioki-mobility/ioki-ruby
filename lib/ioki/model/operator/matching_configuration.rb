# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class MatchingConfiguration < Base
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

        attribute :area,
                  on:         :read,
                  type:       :object,
                  class_name: 'Area'

        attribute :name,
                  on:   :read,
                  type: :string

        attribute :slug,
                  on:   :read,
                  type: :string
      end
    end
  end
end
