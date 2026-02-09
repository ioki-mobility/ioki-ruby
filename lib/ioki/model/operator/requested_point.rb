# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RequestedPoint < Base
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

        attribute :city,
                  on:   [:create, :read],
                  type: :string

        attribute :country,
                  on:   [:create, :read],
                  type: :string

        attribute :county,
                  on:   [:create, :read],
                  type: :string

        attribute :display_times,
                  on:   :read,
                  type: :array

        attribute :formatted_street,
                  on:         :read,
                  type:       :string,
                  deprecated: true

        attribute :formatted_address,
                  on:   :read,
                  type: :string

        attribute :lat,
                  on:   [:create, :read],
                  type: :float

        attribute :lng,
                  on:   [:create, :read],
                  type: :float

        attribute :location_name,
                  on:   [:create, :read],
                  type: :string

        attribute :postal_code,
                  on:   [:create, :read],
                  type: :string

        attribute :station_id,
                  on:   [:create, :read],
                  type: :string

        attribute :street_name,
                  on:   [:create, :read],
                  type: :string

        attribute :street_number,
                  on:   [:create, :read],
                  type: :string

        attribute :time,
                  on:   [:create, :read],
                  type: :date_time

        attribute :waypoint_type,
                  on:   :read,
                  type: :string
      end
    end
  end
end
