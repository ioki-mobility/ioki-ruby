# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationTotals < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :aggregation_name,
                    on:   :read,
                    type: :string

          attribute :measures,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportAggregationMeasureTotal'
        end
      end
    end
  end
end
