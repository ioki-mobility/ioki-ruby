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

          attribute :dimension_name,
                    on:   :read,
                    type: :string

          attribute :localized_dimension_name,
                    on:   :read,
                    type: :string

          attribute :dimension_value,
                    on:   :read,
                    type: :string

          attribute :localized_dimension_value,
                    on:   :read,
                    type: :string

          attribute :points,
                    on:   :read,
                    type: :array
        end
      end
    end
  end
end
