# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class Report < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :id,
                    on:   :read,
                    type: :string

          attribute :scope,
                    on:   :read,
                    type: :string

          attribute :local_year,
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

          attribute :period_type,
                    on:   :read,
                    type: :string

          attribute :period_identifier,
                    on:   :read,
                    type: :string

          attribute :report_version,
                    on:   :read,
                    type: :integer

          attribute :product_id,
                    on:   :read,
                    type: :string

          attribute :operator_id,
                    on:   :read,
                    type: :string

          attribute :starts_at,
                    on:   :read,
                    type: :date_time

          attribute :ends_at,
                    on:   :read,
                    type: :date_time

          attribute :timezone_identifier,
                    on:   :read,
                    type: :string

          attribute :column_identifiers,
                    on:   :read,
                    type: :array

          attribute :row_schema,
                    on:   :read,
                    type: :object

          attribute :column_definitions,
                    on:         :read,
                    type:       :array,
                    class_name: 'ReportColumnDefinition'

          attribute :processing_state,
                    on:   :read,
                    type: :string

          attribute :visible_while_draft,
                    on:   :read,
                    type: :boolean

          attribute :created_at,
                    on:   :read,
                    type: :date_time

          attribute :updated_at,
                    on:   :read,
                    type: :date_time
        end
      end
    end
  end
end
