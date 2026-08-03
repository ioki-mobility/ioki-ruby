# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class GeocodingSearchResults < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :results,
                  on:         :read,
                  type:       :array,
                  class_name: 'Ioki::Model::Passenger::GeocodingSearchResult'
      end
    end
  end
end
