# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class GeocodingSearch < Base
        attribute :query,
                  on:   :create,
                  type: :string

        attribute :product_id,
                  on:   :create,
                  type: :string

        attribute :place_types,
                  on:   :create,
                  type: :string

        attribute :result_types,
                  on:   :create,
                  type: :array
      end
    end
  end
end
