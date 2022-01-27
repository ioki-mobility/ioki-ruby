# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Journey < Base
        attribute :legs, type: :array, on: :read, class_name: 'Leg'
        attribute :version, type: :integer, on: :read
      end
    end
  end
end
