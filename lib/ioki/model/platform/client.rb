# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Client < Base
        attribute :web_user_account_deletion_slug, type: :string, on: [:create, :read, :update]
        attribute :terms_of_service_url_override, type: :string, on: [:create, :read, :update]
        attribute :supports_web_deletion_requests, type: :boolean, on: [:create, :read, :update]
        attribute :support_website_url_override, type: :string, on: [:create, :read, :update]
        attribute :support_phone_number_override, type: :string, on: [:create, :read, :update]
        attribute :support_email_override, type: :string, on: [:create, :read, :update]
        attribute :render_deprecated_attributes, type: :boolean, on: [:create, :read, :update]
        attribute :provider_id, type: :string, on: [:create, :read, :update]
        attribute :product_ids, type: :array, on: [:create, :read, :update]
        attribute :privacy_policy_url_override, type: :string, on: [:create, :read, :update]
        attribute :platform, type: :string, on: [:create, :read, :update]
        attribute :ios_team_id, type: :string, on: [:create, :read, :update]
        attribute :ios_apple_identifier, type: :string, on: [:create, :read, :update]
        attribute :ios_bundle_identifier, type: :string, on: [:create, :read, :update]
        attribute :imprint_url_override, type: :string, on: [:create, :read, :update]
        attribute :imprint_override, type: :string, on: [:create, :read, :update]
        attribute :help_url_override, type: :string, on: [:create, :read, :update]
        attribute :distribution_url, type: :string, on: [:create, :read, :update]
        attribute :default_user_segment_id, type: :string, on: [:create, :read, :update]
        attribute :default_map_zoom_level, type: :number, on: [:create, :read, :update]
        attribute :default_map_center_lng, type: :number, on: [:create, :read, :update]
        attribute :default_map_center_lat, type: :number, on: [:create, :read, :update]
        attribute :deeplink_scheme, type: :string, on: [:create, :read, :update]
        attribute :client_type, type: :string, on: [:create, :read, :update]
        attribute :brand_color_override, type: :string, on: [:create, :read, :update]
        attribute :android_package_name, type: :string, on: [:create, :read, :update]
        attribute :android_certificate_fingerprints, type: :array, on: [:create, :read, :update]
        attribute :accessible_user_segment_ids, type: :array, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :allows_external_payment, on: :read, type: :boolean
        attribute :current_version, on: :read, type: :string
        attribute :identifier, on: :read, type: :string
        attribute :min_version, on: :read, type: :string
        attribute :name, on: :read, type: :string
      end
    end
  end
end
