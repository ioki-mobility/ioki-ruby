# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class BoundingBox < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at, :type and
        # :id.

        def self.schema_path
          'bounding_box'
        end

        attribute :min, on: :read, type: :object, class_name: 'Coordinate'
        attribute :max, on: :read, type: :object, class_name: 'Coordinate'
      end
    end
  end
end
