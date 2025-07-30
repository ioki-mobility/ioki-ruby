# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class FleetState < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :limit_reached,
                  on:   :read,
                  type: :boolean

        attribute :vehicles,
                  on:         :read,
                  type:       :array,
                  class_name: 'Vehicle'
      end
    end
  end
end
