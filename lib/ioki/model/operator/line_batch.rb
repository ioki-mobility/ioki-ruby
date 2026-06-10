# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class LineBatch < Base
        def self.schema_path
          'operator_api--v20210101--line_batch_archive_schema'
        end

        attribute :line_ids,
                  on:   :create,
                  type: :array
      end
    end
  end
end
