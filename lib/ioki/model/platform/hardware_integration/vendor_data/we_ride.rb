# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        module VendorData
          class WeRide < Base
            attribute :type,
                      on:   :read,
                      type: :string

            attribute :asset_type,
                      on:   :create,
                      type: :string

            attribute :vendor_id,
                      on:   :read,
                      type: :string

            attribute :base_url,
                      on:   :read,
                      type: :string

            attribute :token,
                      on:   :read,
                      type: :string

            attribute :channel,
                      on:   :read,
                      type: :string
          end
        end
      end
    end
  end
end
