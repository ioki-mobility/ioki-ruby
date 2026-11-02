# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        module VendorData
          class Iav < Base
            attribute :type,
                      on:   :read,
                      type: :string

            attribute :vendor_id,
                      on:   :read,
                      type: :string

            attribute :client_id,
                      on:   :read,
                      type: :string

            attribute :client_secret,
                      on:   :read,
                      type: :string

            attribute :project,
                      on:   :read,
                      type: :string
          end
        end
      end
    end
  end
end
