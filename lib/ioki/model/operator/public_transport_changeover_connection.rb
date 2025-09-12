# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class PublicTransportChangeoverConnection < Base
        attribute :transport_station_name,
                  on:   [:create],
                  type: :string

        attribute :transport_station_vendor,
                  on:   [:create],
                  type: :string

        attribute :transport_station_vendor_id,
                  on:   [:create],
                  type: :string

        attribute :transport_station_types,
                  on:   [:create],
                  type: :array
      end
    end
  end
end
