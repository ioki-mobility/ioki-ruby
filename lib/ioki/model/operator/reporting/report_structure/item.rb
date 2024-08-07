# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        module ReportStructure
          class Item < Base
            attribute :type,
                      on:   :read,
                      type: :string

            attribute :name,
                      on:   :read,
                      type: :string

            attribute :label,
                      on:   :read,
                      type: :string

            attribute :description,
                      on:   :read,
                      type: :string
          end
        end
      end
    end
  end
end
