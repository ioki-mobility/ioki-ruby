# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Assistance < Ioki::Model::Base
        # Note that this does not inherit from Base because :created_at, :updated_at and :id are not defined.

        def self.schema_path
          'passenger_api--ride_inquiry--assistance'
        end

        attribute :href, on: :read, type: :string
        attribute :text, on: :read, type: :string
        attribute :title, on: :read, type: :string
        attribute :type, on: :read, type: :string
      end
    end
  end
end
