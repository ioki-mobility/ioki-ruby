# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Geojson < Base
        unvalidated true

        attribute :coordinates, type: :array, on: [:create, :read]
        attribute :type, type: :string, on: [:create, :read]
      end
    end
  end
end
