# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationSplit < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :dimension_type,
                    on:   :read,
                    type: :string

          attribute :localized_name,
                    on:   :read,
                    type: :string

          attribute :localized_values,
                    on:   :read,
                    type: :array

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :thresholds,
                    on:   :read,
                    type: :array

          attribute :values,
                    on:   :read,
                    type: :array
        end
      end
    end
  end
end
