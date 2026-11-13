# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationMeasureSeries < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :measure_name,
                    on:   :read,
                    type: :string

          attribute :localized_measure_name,
                    on:   :read,
                    type: :string

          attribute :localized_measure_description,
                    on:   :read,
                    type: :string

          attribute :format_type,
                    on:   :read,
                    type: :string

          attribute :format_unit,
                    on:   :read,
                    type: :string

          attribute :dimensions,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportAggregationDimension'

          attribute :points,
                    on:   :read,
                    type: :array
        end
      end
    end
  end
end
