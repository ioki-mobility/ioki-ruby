# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Product < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :name, on: :read
        attribute :provider, type: :object, on: :read, class_name: 'Provider'
        attribute :ad_hoc_bookable, on: :read, type: :boolean
        attribute :announcement, on: :read, type: :object, class_name: 'Announcement'
        attribute :area, on: :read, type: :object, class_name: 'Area'
        attribute :avatar, on: :read, type: :object, class_name: 'ImageUpload'
        attribute :avatar_darkmode, on: :read, type: :object, class_name: 'ImageUpload'
        attribute :bounding_box, on: :read, type: :object, class_name: 'BoundingBox'
        attribute :cancellation_statements, on: :read, type: :array, class_name: 'CancellationStatement'
        attribute :description, on: :read, type: :string
        attribute :fixed_stations, on: :read, type: :array, class_name: 'Station'
        attribute :personal_discount_types, on: :read, type: :array, class_name: 'PersonalDiscountType'
        attribute :phone_number, on: :read, type: :string
        attribute :prebookable, on: :read, type: :boolean
        attribute :requires_fixed_station, on: :read, type: :boolean
        attribute :ride_options, on: :read, type: :object, class_name: 'RideOptions'
        attribute :ride_rating_criteria, on: :read, type: :array
        attribute :service_time_info, on: :read, type: :string
        attribute :supports_passenger_cancellation_reason, on: :read, type: :boolean
        attribute :supports_prebooking_ui_assistance, on: :read, type: :boolean
        attribute :supports_updating_passengers_on_ride, on: :read, type: :boolean
        attribute :timezone, on: :read, type: :object, class_name: 'Timezone'
        attribute :tipping, on: :read, type: :object, class_name: 'Tipping'
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
