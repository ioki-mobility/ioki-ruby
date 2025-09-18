# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class CustomTag < Base
        def self.schema_path
          'operator_api--v20210101--custom_tag_schema'
        end

        attribute :label,
                  on:   [:create, :read, :update],
                  type: :string
      end
    end
  end
end
