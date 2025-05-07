# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportPartitionSummary < Base
          attribute :visible_while_draft, type: :boolean, on: [:create, :read, :update]
          attribute :default_query_timeframe, type: :string, on: [:create, :read, :update]
          attribute :period_type, type: :string, on: [:create, :read, :update]
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :scope,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :release_stage,
                    on:   :read,
                    type: :string

          attribute :report_partition_infos,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportPartitionInfo'
        end
      end
    end
  end
end
