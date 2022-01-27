# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class BoundingBox < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :created_at, :id, :type and :updated_at.

        def self.schema_path
          'bounding_box'
        end

        attribute :min, on: :read, type: :object, class_name: 'Coordinate'
        attribute :max, on: :read, type: :object, class_name: 'Coordinate'
      end
    end
  end
end
