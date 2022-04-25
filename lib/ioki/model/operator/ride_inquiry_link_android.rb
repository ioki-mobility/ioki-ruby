# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RideInquiryLinkAndroid < Base
        unvalidated true # No specification available.

        attribute :android_store_url, on: :read, type: :string
        attribute :deeplink_android, on: :read, type: :string
        attribute :android_package_name, on: :read, type: :string
      end
    end
  end
end
