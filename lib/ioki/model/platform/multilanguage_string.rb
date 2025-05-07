# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class MultilanguageString < Base
        def self.schema_path
          'multilanguage_string'
        end

        attribute :en_bz, type: :string, on: [:create, :read, :update]
        attribute :uk, type: :string, on: [:create, :read, :update]
        attribute :tr, type: :string, on: [:create, :read, :update]
        attribute :da, type: :string, on: [:create, :read, :update]
        attribute :ar, type: :string, on: [:create, :read, :update]
        attribute :en_jm, type: :string, on: [:create, :read, :update]
        attribute :ca, type: :string, on: [:create, :read, :update]
        attribute :it, type: :string, on: [:create, :read, :update]
        attribute :es, type: :string, on: [:create, :read, :update]
        attribute :nl, type: :string, on: [:create, :read, :update]
        attribute :de_ch, type: :string, on: [:create, :read, :update]
        attribute :fr, type: :string, on: [:create, :read, :update]
        attribute :en, type: :string, on: [:create, :read, :update]
        attribute :de, type: :string, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :name, on: :read, type: :string
        attribute :translations, on: :read, type: :array, class_name: 'Translation'
      end
    end
  end
end
