# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Translation < Base
        def self.schema_path
          'translation'
        end

        attribute :type, on: :read, type: :string
        attribute :language, on: :read, type: :string
        attribute :text, on: :read, type: :string
      end
    end
  end
end
