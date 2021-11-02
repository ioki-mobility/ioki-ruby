# frozen_string_literal: true

require 'ioki/model/platform/provider'
require 'ioki/model/platform/area'

module Ioki
  module Model
    module Platform
      class Product < Base
        attribute :name, on: :read
        attribute :provider, type: :object, on: :read, model_class: Ioki::Model::Platform::Provider
        attribute :area, type: :object, on: :read, model_class: Ioki::Model::Platform::Area
      end
    end
  end
end
