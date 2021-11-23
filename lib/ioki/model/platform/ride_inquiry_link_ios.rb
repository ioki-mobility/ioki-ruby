# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class RideInquiryLinkIos < Ioki::Model::Base
        # Note that this does not inherit from Ioki::Model::Platform::Base because it does not implement :created_at, :updated_at, :type and :id.

        unvalidated true # No specification available.

        attribute :ios_store_url, on: :read, type: :string
        attribute :deeplink_ios, on: :read, type: :string
        attribute :ios_app_id, on: :read, type: :string
      end
    end
  end
end
