# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        module EventData
          class AssetUpdate < Base
            # The type triebwerk accepts on create; responses carry their own, hardware_integration/event_data/asset_update
            attribute :type,
                      on:      [:read, :create],
                      type:    :string,
                      default: 'event_data/asset_update'

            attribute :sds_state,
                      on:   [:read, :create],
                      type: :string

            attribute :sds_telemetry_active,
                      on:   [:read, :create],
                      type: :boolean

            attribute :sds_door_control_available,
                      on:   [:read, :create],
                      type: :boolean

            attribute :sds_error,
                      on:         [:read, :create],
                      type:       :object,
                      class_name: 'AssetUpdateSdsError'
          end
        end
      end
    end
  end
end
