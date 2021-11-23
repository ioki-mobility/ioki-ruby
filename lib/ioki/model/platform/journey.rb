# frozen_string_literal: true

require 'ioki/model/platform/leg'

module Ioki
  module Model
    module Platform
      class Journey < Base
        attribute :legs, type: :array, on: :read, model_class: Ioki::Model::Platform::Leg
        attribute :version, type: :integer, on: :read
      end
    end
  end
end
