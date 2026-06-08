# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationTotalsQuery < Base
          attribute :start_time,
                    on:   :create,
                    type: :date_time

          attribute :end_time,
                    on:   :create,
                    type: :date_time

          attribute :filters,
                    on:             :create,
                    type:           :array,
                    class_name:     'ReportAggregationFilterParam',
                    omit_if_nil_on: :create
        end
      end
    end
  end
end
