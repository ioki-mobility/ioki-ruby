# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Geojson < Base
        unvalidated true

        attribute :coordinates, type: :array, on: [:create, :read, :update]
        attribute :type, type: :string, on: [:create, :read, :update]

        def serialize(usecase = :read, only_changed: true)
          case usecase
          when :read then super
          else @_raw_attributes.to_json
          end
        end
      end
    end
  end
end
