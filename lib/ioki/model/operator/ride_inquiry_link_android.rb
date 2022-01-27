# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RideInquiryLinkAndroid < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at, :type and
        # :id.

        unvalidated true # No specification available.

        attribute :android_store_url, on: :read, type: :string
        attribute :deeplink_android, on: :read, type: :string
        attribute :android_package_name, on: :read, type: :string
      end
    end
  end
end
