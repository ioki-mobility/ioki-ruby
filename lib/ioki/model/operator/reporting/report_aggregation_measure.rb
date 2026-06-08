# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationMeasure < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :function,
                    on:   :read,
                    type: :string

          attribute :percentile,
                    on:   :read,
                    type: :float

          attribute :localized_function,
                    on:   :read,
                    type: :string

          attribute :localized_label,
                    on:   :read,
                    type: :string

          attribute :localized_type,
                    on:   :read,
                    type: :string

          attribute :value_type,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
