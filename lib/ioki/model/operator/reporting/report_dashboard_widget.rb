# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportDashboardWidget < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :localized_name,
                    on:   :read,
                    type: :string

          attribute :report_name,
                    on:   :read,
                    type: :string

          attribute :aggregation_name,
                    on:   :read,
                    type: :string

          attribute :localized_aggregation_name,
                    on:   :read,
                    type: :string

          attribute :query_type,
                    on:   :read,
                    type: :string

          attribute :default_preset,
                    on:   :read,
                    type: :string

          attribute :default_bucket,
                    on:   :read,
                    type: :string

          attribute :visualization,
                    on:   :read,
                    type: :string

          attribute :bucket,
                    on:         :read,
                    type:       :object,
                    class_name: 'ReportAggregationBucket'

          attribute :measures,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportAggregationMeasure'

          attribute :dimensions,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportAggregationDimension'

          attribute :filters,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportAggregationFilter'
        end
      end
    end
  end
end
