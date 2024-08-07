# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportRow < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :id,
                    on:   :read,
                    type: :string

          attribute :data,
                    on:   :read,
                    type: :array

          attribute :created_at,
                    on:   :read,
                    type: :date_time
        end
      end
    end
  end
end
