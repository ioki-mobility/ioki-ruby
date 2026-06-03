# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregation < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :visualization,
                    on:   :read,
                    type: :string

          attribute :localized_visualization,
                    on:   :read,
                    type: :string

          attribute :release_stage,
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
