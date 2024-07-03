# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Geojson < Base
        unvalidated true

        attribute :coordinates, type: :array, on: [:create, :read]
        attribute :type, type: :string, on: [:create, :read]

        def serialize(usecase = :read, only_changed: true)
          case usecase
          when :read
            super
          when :create
            { coordinates: }.to_json
          end
        end
      end
    end
  end
end
