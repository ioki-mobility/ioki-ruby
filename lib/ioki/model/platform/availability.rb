# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Availability < Base
        unvalidated true # No specification available

        attribute :available, on: :read, type: :boolean
        attribute :next_availability, on: :read, type: :date_time
      end
    end
  end
end
