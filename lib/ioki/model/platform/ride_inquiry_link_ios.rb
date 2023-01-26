# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class RideInquiryLinkIos < Base
        unvalidated true # No specification available.

        attribute :ios_store_url, on: :read, type: :string
        attribute :deeplink_ios, on: :read, type: :string
        attribute :ios_app_id, on: :read, type: :string
      end
    end
  end
end
