# frozen_string_literal: true

require 'ioki/model/platform/ride_inquiry_link_android'
require 'ioki/model/platform/ride_inquiry_link_ios'

module Ioki
  module Model
    module Platform
      class RideInquiryLink < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at, :type and :id.

        def self.schema_path
          'platform_api--v20210101--ride_inquiry--links'
        end

        attribute :android, on: :read, type: :object, model_class: RideInquiryLinkAndroid
        attribute :ios, on: :read, type: :object, model_class: RideInquiryLinkIos
        attribute :universal_link, on: :read, type: :string
        attribute :web_booking_url, on: :read, type: :string
      end
    end
  end
end
