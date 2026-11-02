# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        module VendorData
          class Navya < Base
            attribute :type,
                      on:   :read,
                      type: :string

            attribute :vendor_id,
                      on:   :read,
                      type: :string

            attribute :base_url,
                      on:   :read,
                      type: :string

            attribute :password,
                      on:   :read,
                      type: :string

            attribute :site_id,
                      on:   :read,
                      type: :string

            attribute :username,
                      on:   :read,
                      type: :string
          end
        end
      end
    end
  end
end
