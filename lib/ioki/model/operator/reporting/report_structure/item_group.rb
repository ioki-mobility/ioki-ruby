# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        module ReportStructure
          class ItemGroup < Base
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

            attribute :items,
                      on:         :read,
                      type:       :array,
                      class_name: ['Item', 'ItemGroup', 'Divider']
          end
        end
      end
    end
  end
end
