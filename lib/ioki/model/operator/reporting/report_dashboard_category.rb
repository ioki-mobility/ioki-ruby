# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportDashboardCategory < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :category_name,
                    on:   :read,
                    type: :string

          attribute :localized_category_name,
                    on:   :read,
                    type: :string

          attribute :widget_groups,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportDashboardWidgetGroup'
        end
      end
    end
  end
end
