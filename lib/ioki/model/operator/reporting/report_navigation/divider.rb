# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        module ReportNavigation
          class Divider < Base
            attribute :type,
                      on:   :read,
                      type: :string
          end
        end
      end
    end
  end
end
