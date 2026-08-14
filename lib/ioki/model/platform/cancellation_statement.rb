# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class CancellationStatement < Base
        attribute :suitable_for_single_rides, type: :boolean, on: [:create, :read, :update]
        attribute :suitable_for_ride_series, type: :boolean, on: [:create, :read, :update]
        attribute :updated_at, type: :string, on: [:create, :read, :update]
        attribute :created_at, type: :string, on: [:create, :read, :update]
        attribute :id, type: :string, on: [:create, :read, :update]
        attribute :type, type: :string, on: [:create, :read, :update]
        attribute :group, on: :read, type: :string
        attribute :identifier, on: :read, type: :string
        attribute :product_id, on: :read, type: :string
        attribute :title, on: :read, type: :string
      end
    end
  end
end
