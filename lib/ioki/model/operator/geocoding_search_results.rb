# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class GeocodingSearchResults < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :results,
                  on:    :read,
                  type:  :array,
                  class: 'Ioki::Model::Operator::GeocodingSearchResult'
      end
    end
  end
end
