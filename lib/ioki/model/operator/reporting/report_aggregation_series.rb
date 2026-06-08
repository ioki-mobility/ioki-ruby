# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationSeries < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :aggregation_name,
                    on:   :read,
                    type: :string

          attribute :visualization,
                    on:   :read,
                    type: :string

          attribute :timezone_identifier,
                    on:   :read,
                    type: :string

          attribute :buckets,
                    on:   :read,
                    type: :array

          attribute :bucket,
                    on:   :read,
                    type: :string

          attribute :measures,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportAggregationMeasureSeries'

          attribute :partitions_considered,
                    on:   :read,
                    type: :integer

          attribute :definition_versions,
                    on:   :read,
                    type: :array
        end
      end
    end
  end
end
