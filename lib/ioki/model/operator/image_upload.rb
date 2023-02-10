# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ImageUpload < Base
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

        attribute :variants,
                  on:         :read,
                  type:       :array,
                  class_name: 'ImageVariant'
      end
    end
  end
end
