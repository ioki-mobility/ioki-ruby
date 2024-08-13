# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class ReportScope < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :id,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
