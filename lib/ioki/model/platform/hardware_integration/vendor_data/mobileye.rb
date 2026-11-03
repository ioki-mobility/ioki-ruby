# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        module VendorData
          class Mobileye < Base
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

            attribute :https_certificate,
                      on:   :read,
                      type: :string

            attribute :project_id,
                      on:   :read,
                      type: :string
          end
        end
      end
    end
  end
end
