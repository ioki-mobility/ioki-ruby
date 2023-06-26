# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class PeripheralItem < Base
        attribute :id,
                  on:   :read,
                  type: :string
      end
    end
  end
end
