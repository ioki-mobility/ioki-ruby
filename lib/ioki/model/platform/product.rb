# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Product < Base
        attribute :name, on: :read
        attribute :provider, type: :object, on: :read, class_name: 'Provider'
        attribute :area, type: :object, on: :read, class_name: 'Area'
        attribute :ad_hoc_bookable, on: :read, type: :boolean
        attribute :bounding_box, on: :read, type: :object, class_name: 'BoundingBox'
        attribute :description, on: :read, type: :string
        attribute :fixed_stations, on: :read, type: :array, class_name: 'Station'
        attribute :matching_configurations, on: :read, type: :array, class_name: 'MatchingConfiguration'
        attribute :prebookable, on: :read, type: :boolean
        attribute :ride_options, on: :read, type: :object, class_name: 'RideOptions'
        attribute :ride_rating_criteria, on: :read, type: :array
        attribute :service_time_info, on: :read, type: :string
        attribute :timezone, on: :read, type: :object, class_name: 'Timezone'
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
