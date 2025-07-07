# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportPartitionInfoVariant < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :report_version,
                    on:   :read,
                    type: :integer

          attribute :definition_version,
                    on:   :read,
                    type: :integer

          attribute :processing_state,
                    on:   :read,
                    type: :string

          attribute :visible_while_draft,
                    on:   :read,
                    type: :boolean
        end
      end
    end
  end
end
