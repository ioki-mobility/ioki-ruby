# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module FeatureSet
        class HardwareIntegrationAssetFeatures < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :door_open_requires_attendance,
                    on:   :read,
                    type: :boolean
        end
      end
    end
  end
end
