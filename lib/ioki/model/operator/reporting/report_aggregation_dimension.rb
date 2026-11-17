# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationDimension < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :dimension_type,
                    on:   :read,
                    type: :string

          attribute :from,
                    on:   :read,
                    type: :float

          attribute :localized_name,
                    on:   :read,
                    type: :string

          attribute :localized_value,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :to,
                    on:   :read,
                    type: :float

          attribute :value,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
