# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportColumnDefinition < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :column_name,
                    on:   :read,
                    type: :string

          attribute :localized_label,
                    on:   :read,
                    type: :string

          attribute :localized_description,
                    on:   :read,
                    type: :string

          attribute :json_schema,
                    on:   :read,
                    type: :object

          attribute :visible_web,
                    on:   :read,
                    type: :boolean

          attribute :visible_filter,
                    on:   :read,
                    type: :boolean

          attribute :visible_export,
                    on:   :read,
                    type: :boolean

          attribute :link_template,
                    on:   :read,
                    type: :string

          attribute :format_type,
                    on:   :read,
                    type: :string

          attribute :format_unit,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
