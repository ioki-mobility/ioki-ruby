# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        class Asset < Base
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

          attribute :asset_type,
                    on:   :read,
                    type: :string

          attribute :attendance_static_token,
                    on:   :read,
                    type: :string

          attribute :description,
                    on:   :read,
                    type: :string

          attribute :features,
                    on:         :read,
                    type:       :object,
                    class_name: 'Ioki::Model::Platform::FeatureSet::HardwareIntegrationAssetFeatures'

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :provider_id,
                    on:   :read,
                    type: :string

          attribute :state,
                    on:   :read,
                    type: :string

          attribute :vehicle,
                    on:         :read,
                    type:       :object,
                    class_name: 'Ioki::Model::Platform::Vehicle'

          attribute :vendor_data,
                    on:         :read,
                    type:       :object,
                    class_name: [
                      'VendorData::Easymile',
                      'VendorData::Iav',
                      'VendorData::Mobileye',
                      'VendorData::Navya',
                      'VendorData::WeRide'
                    ]
        end
      end
    end
  end
end
