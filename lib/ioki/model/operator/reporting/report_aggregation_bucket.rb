# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportAggregationBucket < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :col,
                    on:   :read,
                    type: :string

          attribute :default_preset,
                    on:   :read,
                    type: :string

          attribute :granularities,
                    on:   :read,
                    type: :array

          attribute :localized_col,
                    on:   :read,
                    type: :string

          attribute :localized_granularities,
                    on:   :read,
                    type: :array

          attribute :localized_on,
                    on:   :read,
                    type: :string

          attribute :localized_presets,
                    on:   :read,
                    type: :array

          attribute :localized_row,
                    on:   :read,
                    type: :string

          attribute :on,
                    on:   :read,
                    type: :string

          attribute :periodic,
                    on:   :read,
                    type: :boolean

          attribute :presets,
                    on:   :read,
                    type: :array

          attribute :row,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
