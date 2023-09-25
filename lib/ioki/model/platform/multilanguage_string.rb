# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class MultilanguageString < Base
        attribute :type, on: :read, type: :string
        attribute :name, on: :read, type: :string
        attribute :translations, on: :read, type: :array, class_name: 'Translation'
      end
    end
  end
end
