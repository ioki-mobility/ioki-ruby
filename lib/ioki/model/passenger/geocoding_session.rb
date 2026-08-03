# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class GeocodingSession < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :valid_until,
                  on:   :read,
                  type: :date_time

        attribute :product_id,
                  on:   :create,
                  type: :string
      end
    end
  end
end
