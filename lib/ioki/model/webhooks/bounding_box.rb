# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class BoundingBox < Base
        def self.schema_path
          'bounding_box'
        end

        attribute :max, type: :object
        attribute :min, type: :object
      end
    end
  end
end
