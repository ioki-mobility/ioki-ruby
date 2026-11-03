# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationRangeSplitValue < Base
          attribute :count,
                    on:   :read,
                    type: :integer

          attribute :from,
                    on:   :read,
                    type: :float

          attribute :label,
                    on:   :read,
                    type: :string

          attribute :to,
                    on:   :read,
                    type: :float
        end
      end
    end
  end
end
