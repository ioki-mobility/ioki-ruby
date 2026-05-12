# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RideTemplate < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :passengers,
                  on:         :read,
                  type:       :array,
                  class_name: 'RidePassenger'
      end
    end
  end
end
