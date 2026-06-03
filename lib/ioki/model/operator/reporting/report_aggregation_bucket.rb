# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationBucket < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :granularities,
                    on:   :read,
                    type: :array

          attribute :localized_granularities,
                    on:   :read,
                    type: :array

          attribute :presets,
                    on:   :read,
                    type: :array

          attribute :localized_presets,
                    on:   :read,
                    type: :array

          attribute :default_preset,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
