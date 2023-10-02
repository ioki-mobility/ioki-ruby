# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class MultilanguageString < Base
        def self.schema_path
          'multilanguage_string'
        end

        attribute :type, on: :read, type: :string
        attribute :name, on: :read, type: :string
        attribute :translations, on: :read, type: :array, class_name: 'Translation'
      end
    end
  end
end
