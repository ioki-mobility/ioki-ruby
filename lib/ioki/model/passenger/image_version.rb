# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class ImageVersion < Base
        def self.schema_path
          'image--image_versions'
        end

        attribute :large, on: :read, type: :string
        attribute :medium, on: :read, type: :string
        attribute :small, on: :read, type: :string
        attribute :mini, on: :read, type: :string
      end
    end
  end
end
