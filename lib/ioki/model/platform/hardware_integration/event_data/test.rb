# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        module EventData
          class Test < Base
            attribute :type,
                      on:   [:read, :create],
                      type: :string

            attribute :value,
                      on:   [:read, :create],
                      type: :integer
          end
        end
      end
    end
  end
end
