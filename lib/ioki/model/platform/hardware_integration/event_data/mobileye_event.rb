# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        module EventData
          class MobileyeEvent < Base
            attribute :type,
                      on:   :read,
                      type: :string

            attribute :endpoint,
                      on:   :read,
                      type: :string

            attribute :body,
                      on:   :read,
                      type: :string

            attribute :headers,
                      on:   :read,
                      type: :string
          end
        end
      end
    end
  end
end
