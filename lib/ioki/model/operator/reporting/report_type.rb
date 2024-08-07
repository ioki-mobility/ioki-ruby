# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportType < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :local_year,
                    on:   :read,
                    type: :string

          attribute :period_identifier,
                    on:   :read,
                    type: :string

          attribute :versions,
                    on:   :read,
                    type: :array
        end
      end
    end
  end
end
