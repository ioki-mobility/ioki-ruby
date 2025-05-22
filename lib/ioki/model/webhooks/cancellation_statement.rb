# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class CancellationStatement < Base
        attribute :suitable_for_single_rides, type: :boolean, on: [:create, :read, :update]
        attribute :suitable_for_ride_series, type: :boolean, on: [:create, :read, :update]
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :group, type: :string
        attribute :identifier, type: :string
        attribute :product_id, type: :string
        attribute :title, type: :string
      end
    end
  end
end
