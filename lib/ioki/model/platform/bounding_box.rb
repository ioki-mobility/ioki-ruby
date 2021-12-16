# frozen_string_literal: true

require 'ioki/model/platform/coordinate'

module Ioki
  module Model
    module Platform
      class BoundingBox < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :created_at, :id, :type and :updated_at.

        def self.schema_path
          'bounding_box'
        end

        attribute :min, on: :read, type: :object, model_class: Coordinate
        attribute :max, on: :read, type: :object, model_class: Coordinate
      end
    end
  end
end
