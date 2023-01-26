# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Client < Base
        attribute :type,                   on: :read, type: :string
        attribute :current_version,        on: :read, type: :string
        attribute :default_map_center_lat, on: :read, type: :float
        attribute :default_map_center_lng, on: :read, type: :float
        attribute :default_map_zoom_level, on: :read, type: :integer
        attribute :distribution_url,       on: :read, type: :string
        attribute :features,               on: :read, type: :object, class_name: 'Features'
        attribute :help_url,               on: :read, type: :string
        attribute :identifier,             on: :read, type: :string
        attribute :imprint_url,            on: :read, type: :string
        attribute :min_version,            on: :read, type: :string
        attribute :name,                   on: :read, type: :string
        attribute :phone_number,           on: :read, type: :string
        attribute :privacy_policy_url,     on: :read, type: :string
        attribute :publisher_name,         on: :read, type: :string
        attribute :sms_support_number,     on: :read, type: :string
        attribute :stripe_account_id,      on: :read, type: :string
        attribute :stripe_publishable_key, on: :read, type: :string
        attribute :support_email,          on: :read, type: :string
        attribute :support_website_url,    on: :read, type: :string
        attribute :terms_of_service_url,   on: :read, type: :string
      end
    end
  end
end
