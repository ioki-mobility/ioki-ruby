# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Area < Base
        unvalidated true

        attribute :coordinates, type: :array, on: :read
        attribute :type, type: :string, on: :read
      end
    end
  end
end
