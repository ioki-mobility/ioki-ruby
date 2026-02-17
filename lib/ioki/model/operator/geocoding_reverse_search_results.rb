# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class GeocodingReverseSearchResults < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :results,
                  on:         :read,
                  type:       :array,
                  class_name: 'Ioki::Model::Operator::GeocodingReverseSearchResult'
      end
    end
  end
end
