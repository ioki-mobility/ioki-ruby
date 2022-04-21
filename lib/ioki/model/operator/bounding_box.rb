# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class BoundingBox < Base
        def self.schema_path
          'bounding_box'
        end

        attribute :min, on: :read, type: :object, class_name: 'Coordinate'
        attribute :max, on: :read, type: :object, class_name: 'Coordinate'
      end
    end
  end
end
