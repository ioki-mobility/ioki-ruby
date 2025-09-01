# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class GeocodingSearchResult < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :vendor_id,
                  on:   :read,
                  type: :string

        attribute :vendor,
                  on:   :read,
                  type: :string

        attribute :formatted_address,
                  on:   :read,
                  type: :string

        attribute :description,
                  on:   :read,
                  type: :string

        attribute :location_name,
                  on:   :read,
                  type: :string

        attribute :lat,
                  on:   :read,
                  type: :float

        attribute :lng,
                  on:   :read,
                  type: :float
      end
    end
  end
end
