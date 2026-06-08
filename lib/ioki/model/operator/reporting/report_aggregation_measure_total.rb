# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationMeasureTotal < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :key,
                    on:   :read,
                    type: :string

          attribute :localized_label,
                    on:   :read,
                    type: :string

          attribute :value,
                    on:   :read,
                    type: :float
        end
      end
    end
  end
end
