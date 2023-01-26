# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Geojson < Base
        def self.schema_path
          'geojson'
        end

        attribute :type, type: :string
        attribute :coordinates, type: :array
      end
    end
  end
end
