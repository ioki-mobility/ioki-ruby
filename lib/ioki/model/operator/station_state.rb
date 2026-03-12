# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class StationState < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :limit_reached,
                  on:   :read,
                  type: :boolean

        attribute :stations,
                  on:         :read,
                  type:       :array,
                  class_name: 'Station'

        attribute :station_categories,
                  on:         :read,
                  type:       :array,
                  class_name: 'StationCategory'

        attribute :station_deactivations,
                  on:         :read,
                  type:       :array,
                  class_name: 'Deactivation'
      end
    end
  end
end
