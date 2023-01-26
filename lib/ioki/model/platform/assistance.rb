# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Assistance < Base
        def self.schema_path
          'platform_api--v20210101--ride_inquiry--assistance'
        end

        attribute :href, on: :read, type: :string
        attribute :text, on: :read, type: :string
        attribute :title, on: :read, type: :string
        attribute :type, on: :read, type: :string
      end
    end
  end
end
