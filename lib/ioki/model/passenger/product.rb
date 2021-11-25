# frozen_string_literal: true

require 'ioki/model/passenger/announcement'
require 'ioki/model/passenger/area'
require 'ioki/model/passenger/bounding_box'
require 'ioki/model/passenger/cancellation_statement'
require 'ioki/model/passenger/image_upload'
require 'ioki/model/passenger/personal_discount_type'
require 'ioki/model/passenger/provider'
require 'ioki/model/passenger/ride_options'
require 'ioki/model/passenger/station'
require 'ioki/model/passenger/time_zone'
require 'ioki/model/passenger/tipping'

module Ioki
  module Model
    module Passenger
      class Product < Base
        attribute :name, on: :read
        attribute :provider, type: :object, on: :read, model_class: Provider
        attribute :ad_hoc_bookable, on: :read, type: :boolean
        attribute :announcement, on: :read, type: :object, model_class: Announcement
        attribute :area, on: :read, type: :object, model_class: Area
        attribute :avatar, on: :read, type: :object, model_class: ImageUpload
        attribute :avatar_darkmode, on: :read, type: :object, model_class: ImageUpload
        attribute :bounding_box, on: :read, type: :object, model_class: BoundingBox
        attribute :cancellation_statements, on: :read, type: :array, model_class: CancellationStatement
        attribute :description, on: :read, type: :string
        attribute :fixed_stations, on: :read, type: :array, model_class: Station
        attribute :personal_discount_types, on: :read, type: :array, model_class: PersonalDiscountType
        attribute :phone_number, on: :read, type: :string
        attribute :prebookable, on: :read, type: :boolean
        attribute :requires_fixed_station, on: :read, type: :boolean
        attribute :ride_options, on: :read, type: :object, model_class: RideOptions
        attribute :ride_rating_criteria, on: :read, type: :array
        attribute :service_time_info, on: :read, type: :string
        attribute :supports_passenger_cancellation_reason, on: :read, type: :boolean
        attribute :supports_prebooking_ui_assistance, on: :read, type: :boolean
        attribute :supports_updating_passengers_on_ride, on: :read, type: :boolean
        attribute :timezone, on: :read, type: :object, model_class: TimeZone
        attribute :tipping, on: :read, type: :object, model_class: Tipping
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
