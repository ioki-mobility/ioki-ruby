# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class GeoJson < Base
        def self.schema_path
          'geojson'
        end

        attribute :coordinates, type: :array, on: :read
        attribute :type, type: :string, on: :read
      end
    end
  end
end
