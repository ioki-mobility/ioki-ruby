# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class CancellationStatement < Base
        attribute :suitable_for_single_rides, type: :boolean, on: [:create, :read, :update]
        attribute :suitable_for_ride_series, type: :boolean, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :identifier, on: :read, type: :string
        attribute :title, on: :read, type: :string
      end
    end
  end
end
