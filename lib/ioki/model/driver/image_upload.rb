# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class ImageUpload < Base
        def self.schema_path
          'image'
        end

        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :versions, on: :read, type: :object
      end
    end
  end
end
