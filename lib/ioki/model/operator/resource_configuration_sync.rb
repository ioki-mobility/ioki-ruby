# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ResourceConfigurationSync < Base
        def self.schema_path
          'operator_api--v20210101--vehicle_sync_configuration_schema'
        end

        attribute :vehicle_ids,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :array
      end
    end
  end
end
