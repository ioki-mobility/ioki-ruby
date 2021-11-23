# frozen_string_literal: true

require 'ioki/model/platform/coordinate'

module Ioki
  module Model
    module Platform
      class BoundingBox < Ioki::Model::Base
        # Note that this does not inherit from Ioki::Model::Platform::Base because it does not define :created_at, :id, :type and :updated_at.

        def self.schema_path
          'bounding_box'
        end

        def self.specification_scope
          nil
        end

        attribute :min, on: :read, type: :object, model_class: Ioki::Model::Platform::Coordinate
        attribute :max, on: :read, type: :object, model_class: Ioki::Model::Platform::Coordinate
      end
    end
  end
end
