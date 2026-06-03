# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationDimension < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :localized_label,
                    on:   :read,
                    type: :string

          attribute :values,
                    on:   :read,
                    type: :array

          attribute :localized_values,
                    on:   :read,
                    type: :array
        end
      end
    end
  end
end
