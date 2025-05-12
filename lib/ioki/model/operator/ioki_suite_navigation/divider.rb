# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module IokiSuiteNavigation
        class Divider < Base
          attribute :type,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
