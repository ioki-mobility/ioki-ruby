# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationFilterParam < Base
          attribute :name,
                    on:   :create,
                    type: :string

          attribute :values,
                    on:   :create,
                    type: :array
        end
      end
    end
  end
end
