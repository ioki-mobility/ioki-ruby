# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        module EventData
          class Test < Base
            # The type triebwerk accepts on create; responses carry their own, hardware_integration/event_data/test
            attribute :type,
                      on:      [:read, :create],
                      type:    :string,
                      default: 'event_data/test'

            attribute :value,
                      on:   [:read, :create],
                      type: :integer
          end
        end
      end
    end
  end
end
