# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class HopDetails < Base
        def self.schema_path
          'operator_api--v20210101--hop--public_transport_hop--details'
        end

        attribute :direction,
                  on:   :read,
                  type: :string

        attribute :name,
                  on:   :read,
                  type: :string

        attribute :transport_type,
                  on:   :read,
                  type: :string
      end
    end
  end
end
