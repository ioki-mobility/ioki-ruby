# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Product < Base
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

        attribute :name,
                  on:   :read,
                  type: :string

        attribute :provider,
                  type:       :object,
                  on:         :read,
                  class_name: 'Provider'

        attribute :provider_id,
                  type: :string,
                  on:   :read

        attribute :area,
                  type:       :object,
                  on:         :read,
                  class_name: 'Geojson'

        attribute :ad_hoc_bookable,
                  on:   :read,
                  type: :boolean

        attribute :available_area_types,
                  on:   :read,
                  type: :array

        attribute :boarding_time,
                  on:   :read,
                  type: :integer

        attribute :bounding_box,
                  on:         :read,
                  type:       :object,
                  class_name: 'BoundingBox'

        attribute :custom_flag_names,
                  on:   :read,
                  type: :array

        attribute :default_end_place_id,
                  on:   :read,
                  type: :string

        attribute :default_matching_configuration,
                  on:         :read,
                  type:       :object,
                  class_name: 'MatchingConfiguration'

        attribute :default_service_duration,
                  on:   :read,
                  type: :integer

        attribute :default_service_start,
                  on:   :read,
                  type: :integer

        attribute :default_start_place_id,
                  on:   :read,
                  type: :string

        attribute :description,
                  on:   :read,
                  type: :string

        attribute :disable_station_markers,
                  type: :boolean,
                  on:   :read

        attribute :features,
                  on:         :read,
                  type:       :object,
                  class_name: 'Features'

        attribute :fixed_stations,
                  on:         :read,
                  type:       :array,
                  class_name: 'Station'

        attribute :has_custom_flags,
                  on:   :read,
                  type: :boolean

        attribute :matching_configurations,
                  on:         :read,
                  type:       :array,
                  class_name: 'MatchingConfiguration'

        attribute :parking_time,
                  on:   :read,
                  type: :integer

        attribute :prebookable,
                  on:   :read,
                  type: :boolean

        attribute :product_login_slug,
                  on:   :read,
                  type: :string

        attribute :public_transport_alternatives_adapter,
                  on:   :read,
                  type: :string

        attribute :ride_options,
                  on:         :read,
                  type:       :object,
                  class_name: 'LegacyRideOptions'

        attribute :ride_rating_criteria,
                  on:   :read,
                  type: :array

        attribute :service_time_info,
                  on:   :read,
                  type: :string

        attribute :state,
                  on:   :read,
                  type: :string

        attribute :timezone,
                  on:         :read,
                  type:       :object,
                  class_name: 'Timezone'

        attribute :translated_ride_cancellation_reasons,
                  on:         :read,
                  type:       :array,
                  class_name: 'CancellationReasonWithTranslations'

        attribute :version,
                  on:   :read,
                  type: :integer

        attribute :walker_boarding_time,
                  on:   :read,
                  type: :integer

        attribute :wheelchair_boarding_time,
                  on:   :read,
                  type: :integer
      end
    end
  end
end
