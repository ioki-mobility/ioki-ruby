# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class StationBatch < Base
        def self.schema_path
          'operator_api--v20210101--station_batch_archive_schema'
        end

        attribute :station_ids,
                  on:   :create,
                  type: :array
      end
    end
  end
end
