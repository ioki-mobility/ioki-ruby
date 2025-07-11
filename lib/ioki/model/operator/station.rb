# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Station < Base
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

        attribute :active,
                  on:   :read,
                  type: :boolean

        attribute :approach,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :area,
                  on:         :read,
                  type:       :object,
                  class_name: 'Geojson'

        attribute :area_geojson,
                  on:             [:create, :update],
                  type:           :string,
                  omit_if_nil_on: [:create, :update]

        attribute :avatar,
                  on:         :read,
                  type:       :object,
                  class_name: 'ImageUpload'

        attribute :boarding_time,
                  on:   [:read, :create, :update],
                  type: :integer

        attribute :city,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :country,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :county,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :custom_flags,
                  on:               [:create, :read, :update],
                  type:             :array,
                  omit_if_blank_on: [:create, :update],
                  class_name:       'CustomFlag'

        attribute :deactivations,
                  on:         :read,
                  type:       :array,
                  class_name: 'Deactivation'

        attribute :description,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :dhid,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :drt_to_pt_feeder,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :boolean

        attribute :external_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :fixed,
                  on:   :read,
                  type: :boolean

        attribute :lat,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :float

        attribute :lng,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :float

        attribute :location_name,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :municipality,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :parking_time,
                  on:   [:read, :create, :update],
                  type: :integer

        attribute :postal_code,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :pt_to_drt_feeder,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :boolean

        attribute :station_category_id,
                  on:   [:create, :update, :read],
                  type: :string

        attribute :station_category_slug,
                  on:   :read,
                  type: :string

        attribute :station_type,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string

        attribute :street_name,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :street_number,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :tariff_codes,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :array

        attribute :version,
                  on:             [:read, :update],
                  omit_if_nil_on: [:update],
                  type:           :integer

        attribute :visible_on_map_in_passenger_client,
                  on:             [:read, :create, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :boolean

        attribute :walker_boarding_time,
                  on:   [:read, :create, :update],
                  type: :integer

        attribute :wheelchair_boarding_time,
                  on:   [:read, :create, :update],
                  type: :integer

        attribute :public_transport_changeover,
                  on:   :read,
                  type: :boolean

        attribute :transport_station_name,
                  on:   [:read, :update],
                  type: :string

        attribute :transport_station_vendor,
                  on:   [:read, :update],
                  type: :string

        attribute :transport_station_vendor_id,
                  on:   [:read, :update],
                  type: :string

        attribute :transport_station_types,
                  on:   [:read, :update],
                  type: :array
      end
    end
  end
end
