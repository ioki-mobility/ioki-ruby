# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Product < Base
        attribute :features, type: :object, on: [:create, :read, :update], class_name: 'ProductFeatures'
        attribute :default_map_bounding_box, type: :object, on: [:create, :read, :update], class_name: 'BoundingBox'
        attribute :announcements, type: :array, on: [:create, :read, :update]
        attribute :support_website_url, type: :string, on: [:create, :read, :update]
        attribute :support_phone_number, type: :string, on: [:create, :read, :update]
        attribute :support_email, type: :string, on: [:create, :read, :update]
        attribute :help_url, type: :string, on: [:create, :read, :update]
        attribute :display_stations_on_map, type: :boolean, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :name, on: :read
        attribute :provider, type: :object, on: :read, class_name: 'Provider'
        attribute :ad_hoc_bookable, on: :read, type: :boolean
        deprecated_attribute :announcement, on: :read, type: :object, class_name: 'Announcement'
        deprecated_attribute :area, on: :read, type: :object, class_name: 'Area'
        attribute :avatar, on: :read, type: :object, class_name: 'ImageUpload'
        attribute :avatar_darkmode, on: :read, type: :object, class_name: 'ImageUpload'
        deprecated_attribute :bounding_box, on: :read, type: :object, class_name: 'BoundingBox'
        attribute :cancellation_statements, on: :read, type: :array, class_name: 'CancellationStatement'
        attribute :description, on: :read, type: :string
        attribute :fixed_stations, on: :read, type: :array, class_name: 'Station'
        attribute :payment_method_allowed_on_booking, on: :read, type: :boolean
        attribute :payment_method_required_on_booking, on: :read, type: :boolean
        attribute :personal_discount_types, on: :read, type: :array, class_name: 'PersonalDiscountType'
        deprecated_attribute :phone_number, on: :read, type: :string
        attribute :prebookable, on: :read, type: :boolean
        attribute :requires_fixed_station, on: :read, type: :boolean
        deprecated_attribute :ride_options, on: :read, type: :object, class_name: 'RideOptions'
        deprecated_attribute :ride_rating_criteria, on: :read, type: :array
        attribute :service_time_info, on: :read, type: :string
        deprecated_attribute :supports_passenger_cancellation_reason, on: :read, type: :boolean
        deprecated_attribute :supports_prebooking_ui_assistance, on: :read, type: :boolean
        deprecated_attribute :supports_updating_passengers_on_ride, on: :read, type: :boolean
        attribute :timezone, on: :read, type: :object, class_name: 'Timezone'
        attribute :tipping, on: :read, type: :object, class_name: 'Tipping'
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
