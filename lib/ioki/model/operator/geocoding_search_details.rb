# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class GeocodingSearchDetails < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :create,
                  type: :string

        attribute :vendor_id,
                  on:   :read,
                  type: :string

        attribute :vendor,
                  on:   :read,
                  type: :string

        attribute :vendor_type,
                  on:   :read,
                  type: :string

        attribute :location_name,
                  on:   :read,
                  type: :string

        attribute :formatted_address,
                  on:   :read,
                  type: :string

        attribute :street_name,
                  on:   :read,
                  type: :string

        attribute :street_number,
                  on:   :read,
                  type: :string

        attribute :postal_code,
                  on:   :read,
                  type: :string

        attribute :city,
                  on:   :read,
                  type: :string

        attribute :county,
                  on:   :read,
                  type: :string

        attribute :country,
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
