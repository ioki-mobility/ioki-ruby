# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class FleetState < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :vehicles,
                  on:         :read,
                  type:       :array,
                  class_name: 'Vehicle'
      end
    end
  end
end
