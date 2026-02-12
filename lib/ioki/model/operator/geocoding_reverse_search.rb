# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class GeocodingReverseSearch < Base
        attribute :lat,
                  on:   :create,
                  type: :float

        attribute :lng,
                  on:   :create,
                  type: :float
      end
    end
  end
end
