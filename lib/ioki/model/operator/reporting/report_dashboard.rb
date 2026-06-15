# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportDashboard < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :localized_name,
                    on:   :read,
                    type: :string

          attribute :groups,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportDashboardWidgetGroup'
        end
      end
    end
  end
end
