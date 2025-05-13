# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module IokiSuiteNavigation
        class Label < Base
          attribute :label,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
