# frozen_string_literal: true

require 'ioki/model/platform/area'

module Ioki
  module Model
    module Platform
      class MatchingConfiguration < Base
        attribute :area, on: :read, type: :object, model_class: Area
        attribute :name, on: :read, type: :string
        attribute :slug, on: :read, type: :string
      end
    end
  end
end
