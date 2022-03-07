# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Rating < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :version, type: :integer
        attribute :comment, type: :string
        attribute :driver_rating, type: :integer
        attribute :editable, type: :boolean
        attribute :punctuality_rating, type: :integer
        attribute :ride_rating, type: :integer
        attribute :service_rating, type: :integer
        attribute :vehicle_rating, type: :integer
        attribute :waiting_time_rating, type: :integer
      end
    end
  end
end
