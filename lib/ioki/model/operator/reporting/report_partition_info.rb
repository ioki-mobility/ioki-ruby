# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportPartitionInfo < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :period_identifier,
                    on:   :read,
                    type: :string

          attribute :estimated_row_count,
                    on:   :read,
                    type: :integer

          attribute :versions,
                    on:   :read,
                    type: :array
        end
      end
    end
  end
end
