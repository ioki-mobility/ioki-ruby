# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ProductBulletin < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :severity,
                  on:   :read,
                  type: :string

        attribute :title,
                  on:   :read,
                  type: :string

        attribute :description,
                  on:   :read,
                  type: :string

        attribute :affected_items,
                  on:         :read,
                  type:       :array,
                  class_name: 'AffectedItem'
      end
    end
  end
end