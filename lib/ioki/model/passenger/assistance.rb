# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Assistance < Base
        def self.schema_path
          'passenger_api--v1--ride_inquiry--assistance'
        end

        attribute :href, on: :read, type: :string
        attribute :text, on: :read, type: :string
        attribute :title, on: :read, type: :string
        attribute :type, on: :read, type: :string
      end
    end
  end
end
