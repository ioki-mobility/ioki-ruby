# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Product < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :version, on: :read, type: :integer
        attribute :ad_hoc_bookable, on: :read, type: :boolean
        attribute :comment, on: :read, type: :string
        attribute :description, on: :read, type: :string
        attribute :driver_emergency_phone_number, on: :read, type: :string
        attribute :drivers_planning_url, on: :read, type: :string
        attribute :display_stations_on_map, on: :read, type: :boolean
        attribute :supports_passenger_cancellation_statement, on: :read, type: :boolean
        attribute :help_url, on: :read, type: :string
        attribute :name, on: :read, type: :string
        attribute :payment_method_allowed_on_booking, on: :read, type: :boolean
        attribute :payment_method_required_on_booking, on: :read, type: :boolean
        attribute :prebookable, on: :read, type: :boolean
        attribute :ride_options, on: :read, type: :object, class_name: 'RideOptions'
        attribute :ride_rating_criteria, on: :read, type: :array
        attribute :service_time_info, on: :read, type: :string
        attribute :slug, on: [:read, :update], type: :string
        attribute :support_email, on: :read, type: :string
        attribute :support_phone_number, on: :read, type: :string
        attribute :support_website_url, on: :read, type: :string
        attribute :tableau_url, on: :read, type: :string
        attribute :task_lists_planning_url, on: :read, type: :string
        attribute :timezone, on: :read, type: :object, class_name: 'Timezone'
        attribute :vehicle_operator_info, on: :read, type: :string
        attribute :vehicles_planning_url, on: :read, type: :string
        attribute :announcement, on: :read, type: :object, class_name: 'Announcement'
        attribute :announcements, on: :read, type: :array, class_name: 'Announcement'
        deprecated_attribute :area, type: :object, on: :read, class_name: 'GeoJson'
        attribute :bounding_box, on: :read, type: :object, class_name: 'BoundingBox'
        attribute :default_map_bounding_box, on: :read, type: :object, class_name: 'BoundingBox'
        attribute :features, on: :read, type: :object, class_name: 'ProductFeatures'
        attribute :driver_cancellation_statements, on: :read, type: :array, class_name: 'CancellationStatement'
        attribute :passenger_cancellation_statements, on: :read, type: :array, class_name: 'CancellationStatement'
        attribute :fixed_stations, on: :read, type: :array, class_name: 'Station'
        attribute :matching_configurations, on: :read, type: :array, class_name: 'MatchingConfiguration'
        attribute :passenger_options, on: :read, type: :array, class_name: 'PassengerOption'
        attribute :passenger_types, on: :read, type: :array, class_name: 'PassengerType'
        attribute :product_ride_options, on: :read, type: :array, class_name: 'RideOption'
        attribute :provider, type: :object, on: :read, class_name: 'Provider'
        attribute :tipping, on: :read, type: :object, class_name: 'Tipping'
      end
    end
  end
end
