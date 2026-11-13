# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        module EventData
          class AssetUpdateSdsError < Base
            attribute :type,
                      on:   [:read, :create],
                      type: :string

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
