# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportPartitionSummary < Base
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
