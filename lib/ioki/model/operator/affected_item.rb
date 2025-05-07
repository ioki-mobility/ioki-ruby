# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class AffectedItem < Base
        def self.schema_path
          'operator_api--v20210101--affected_items'
        end
        attribute :id,
                  on:   :read,
                  type: :string
      end
    end
  end
end
