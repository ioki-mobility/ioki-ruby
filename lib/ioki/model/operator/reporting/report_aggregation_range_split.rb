# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationRangeSplit < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :values,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportAggregationRangeSplitValue'
        end
      end
    end
  end
end
