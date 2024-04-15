# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class FleetState < Base
        base 'Array', item_class_name: 'Vehicle'
      end
    end
  end
end
