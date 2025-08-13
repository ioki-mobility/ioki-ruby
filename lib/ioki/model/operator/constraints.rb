# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Constraints < Base
        unvalidated true

        attribute :area,
                  on:         :read,
                  type:       :object,
                  class_name: 'Geojson'

        attribute :inverted_area,
                  on:         :read,
                  type:       :object,
                  class_name: 'Geojson'

        attribute :unserved_area,
                  on:         :read,
                  type:       :object,
                  class_name: 'Geojson'
      end
    end
  end
end
