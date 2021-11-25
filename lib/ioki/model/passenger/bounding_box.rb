# frozen_string_literal: true

require 'ioki/model/passenger/coordinate'

module Ioki
  module Model
    module Passenger
      class BoundingBox < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at, :type and :id.

        def self.schema_path
          'bounding_box'
        end

        def self.specification_scope
          nil
        end

        attribute :min, on: :read, type: :object, model_class: Coordinate
        attribute :max, on: :read, type: :object, model_class: Coordinate
      end
    end
  end
end
