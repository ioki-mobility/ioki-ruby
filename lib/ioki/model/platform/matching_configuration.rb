# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class MatchingConfiguration < Base
        attribute :area, on: :read, type: :object, class_name: 'Area'
        attribute :name, on: :read, type: :string
        attribute :slug, on: :read, type: :string
      end
    end
  end
end
