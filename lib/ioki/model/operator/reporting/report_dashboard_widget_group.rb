# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportDashboardWidgetGroup < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :group_name,
                    on:   :read,
                    type: :string

          attribute :localized_group_name,
                    on:   :read,
                    type: :string

          attribute :widgets,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportDashboardWidget'
        end
      end
    end
  end
end
