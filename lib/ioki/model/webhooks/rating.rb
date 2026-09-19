# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Rating < Base
        attribute :rating_line_items, type: :array, on: [:create, :read, :update]
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :version, type: :integer
        attribute :comment, type: :string
        deprecated_attribute :driver_rating, type: :integer
        attribute :editable, type: :boolean
        deprecated_attribute :punctuality_rating, type: :integer
        deprecated_attribute :ride_rating, type: :integer
        deprecated_attribute :service_rating, type: :integer
        deprecated_attribute :vehicle_rating, type: :integer
        deprecated_attribute :waiting_time_rating, type: :integer
      end
    end
  end
end
