# frozen_string_literal: true

require 'ioki/model/platform/money'

module Ioki
  module Model
    module Platform
      class Package < Base
        unvalidated true

        attribute :cost_object, on: :read, type: :object, model_class: Ioki::Model::Platform::Money
        attribute :value_object, on: :read, type: :object, model_class: Ioki::Model::Platform::Money
      end
    end
  end
end
