# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class Report < Base
          attribute :type,
                    on:   :read,
                    type: :string

        #   attribute :id,
        #             on:   :read,
        #             type: :string

          attribute :scope,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :localized_name,
                    on:   :read,
                    type: :string

          attribute :localized_description,
                    on:   :read,
                    type: :string

          attribute :default_query_timeframe,
                    on:   :read,
                    type: :string

          attribute :filterable_by_product,
                    on:   :read,
                    type: :boolean

          attribute :filterable_by_operator,
                    on:   :read,
                    type: :boolean

          attribute :query_timeframe_starts_at,
                    on:   :read,
                    type: :date_time

          attribute :query_timeframe_ends_at,
                    on:   :read,
                    type: :date_time
        end
      end
    end
  end
end
