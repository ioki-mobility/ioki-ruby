# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        module EventData
          class AssetUpdateSdsError < Base
            # The type triebwerk accepts on create; responses carry their own, hardware_integration/event_data/asset_update_sds_error
            attribute :type,
                      on:      [:read, :create],
                      type:    :string,
                      default: 'event_data/asset_update_sds_error'

            attribute :code,
                      on:   [:read, :create],
                      type: :integer

            attribute :message,
                      on:   [:read, :create],
                      type: :string

            attribute :severity,
                      on:   [:read, :create],
                      type: :integer
          end
        end
      end
    end
  end
end
