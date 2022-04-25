# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RideInquiryLink < Base
        def self.schema_path
          'operator_api--v20210101--ride_inquiry--links'
        end

        attribute :android, on: :read, type: :object, class_name: 'RideInquiryLinkAndroid'
        attribute :ios, on: :read, type: :object, class_name: 'RideInquiryLinkIos'
        attribute :universal_link, on: :read, type: :string
        attribute :web_booking_url, on: :read, type: :string
      end
    end
  end
end
