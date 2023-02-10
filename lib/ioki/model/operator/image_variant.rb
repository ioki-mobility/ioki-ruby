# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ImageVariant < Base
        unvalidated true # Specification not available

        attribute :height,
                  on:   :read,
                  type: :string

        attribute :name,
                  on:   :read,
                  type: :string

        attribute :url,
                  on:   :read,
                  type: :string

        attribute :width,
                  on:   :read,
                  type: :string
      end
    end
  end
end
