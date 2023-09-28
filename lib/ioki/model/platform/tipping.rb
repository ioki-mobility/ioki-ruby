# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Tipping < Base
        attribute :minimum, on: :read, type: :object, class_name: 'Money'
        attribute :maximum, on: :read, type: :object, class_name: 'Money'
        attribute :suggestions, on: :read, type: :array, class_name: 'Money'
      end
    end
  end
end
