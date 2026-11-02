# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        module VendorData
          class Easymile < Base
            attribute :type,
                      on:   :read,
                      type: :string

            attribute :vendor_id,
                      on:   :read,
                      type: :string

            attribute :audience_url,
                      on:   :read,
                      type: :string

            attribute :client_id,
                      on:   :read,
                      type: :string

            attribute :client_secret,
                      on:   :read,
                      type: :string
          end
        end
      end
    end
  end
end
