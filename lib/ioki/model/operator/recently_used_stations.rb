# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RecentlyUsedStations < Base
        attribute :destination_stations,
                  on:         :read,
                  type:       :array,
                  class_name: 'Station'

        attribute :origin_stations,
                  on:         :read,
                  type:       :array,
                  class_name: 'Station'
      end
    end
  end
end
