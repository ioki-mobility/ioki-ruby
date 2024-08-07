# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportTypeSummary < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :scope,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :report_types,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportType'
        end
      end
    end
  end
end
