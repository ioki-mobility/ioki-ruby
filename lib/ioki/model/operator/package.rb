# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Package < Base
        unvalidated true

        attribute :cost_object, on: :read, type: :object, class_name: 'Money'
        attribute :value_object, on: :read, type: :object, class_name: 'Money'
      end
    end
  end
end
