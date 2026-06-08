# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class VehicleBatch < Base
        def self.schema_path
          'operator_api--v20210101--vehicle_batch_archive_schema'
        end

        attribute :vehicle_ids,
                  on:   :create,
                  type: :array
      end
    end
  end
end
