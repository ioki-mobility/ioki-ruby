# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Rating < Base
        attribute :rating_line_items, type: :array, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :version, on: :read, type: :integer
        attribute :comment, on: [:read, :create], type: :string
        deprecated_attribute :driver_rating, on: [:read, :create], type: :integer, omit_if_nil_on: :create
        attribute :editable, on: :read, type: :boolean
        deprecated_attribute :punctuality_rating, on: [:read, :create], type: :integer, omit_if_nil_on: :create
        deprecated_attribute :ride_rating, on: [:read, :create], type: :integer, omit_if_nil_on: :create
        deprecated_attribute :service_rating, on: [:read, :create], type: :integer, omit_if_nil_on: :create
        deprecated_attribute :vehicle_rating, on: [:read, :create], type: :integer, omit_if_nil_on: :create
        deprecated_attribute :waiting_time_rating, on: [:read, :create], type: :integer, omit_if_nil_on: :create
        attribute :ride_version, on: :create, type: :integer
      end
    end
  end
end
