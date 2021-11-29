# frozen_string_literal: true

require 'ioki/model/passenger/booking'
require 'ioki/model/passenger/calculated_point'
require 'ioki/model/passenger/driver'
require 'ioki/model/passenger/rating'
require 'ioki/model/passenger/requested_point'
require 'ioki/model/passenger/ride_passenger'
require 'ioki/model/passenger/route'
require 'ioki/model/passenger/user'

module Ioki
  module Model
    module Passenger
      class Ride < Base
        attribute :state,          type: :string,  on: :read
        attribute :origin,         type: :object,  on: [:create, :read],
model_class: Ioki::Model::Passenger::RequestedPoint
        attribute :destination,    type: :object,  on: [:create, :read],
model_class: Ioki::Model::Passenger::RequestedPoint
        attribute :passengers,     type: :array,   on: [:create, :read],
model_class: Ioki::Model::Passenger::RidePassenger
        attribute :user,           type: :object,  on: :read, model_class: Ioki::Model::Passenger::User
        attribute :booking,        type: :object,  on: :read, model_class: Ioki::Model::Passenger::Booking
        attribute :pickup,         type: :object,  on: :read, model_class: Ioki::Model::Passenger::CalculatedPoint
        attribute :dropoff,        type: :object,  on: :read, model_class: Ioki::Model::Passenger::CalculatedPoint
        attribute :storage_spaces, type: :integer, on: [:read, :create, :update], omit_if_blank_on: [:create, :update],
model_class: Ioki::Model::Passenger::CalculatedPoint

        attribute :book_for_others, type: :boolean, on: [:read, :create, :update]
        attribute :cancellable, type: :boolean, on: [:read, :create, :update]
        attribute :cancellation_reason, type: :string, on: [:read, :create, :update]
        attribute :cancellation_reason_translated, type: :string, on: [:read, :create, :update]
        attribute :driver, type: :object, on: :read, model_class: Ioki::Model::Passenger::Driver
        attribute :driver_can_be_called, type: :boolean, on: [:read, :create, :update]
        attribute :needs_cancellation_code, type: :boolean, on: [:read, :create, :update]
        attribute :passenger_can_be_called, type: :boolean, on: [:read, :create, :update]
        attribute :payment_method, type: :object, on: :read, model_class: Ioki::Model::Passenger::PaymentMethod
        attribute :payment_state, type: :string, on: [:read, :create, :update]
        attribute :prebooked, type: :boolean, on: [:read, :create, :update]
        attribute :product_id, type: :string, on: [:read, :create, :update]
        attribute :public_transport_uri, type: :string, on: [:read, :create, :update]
        attribute :rateable, type: :boolean, on: [:read, :create, :update]
        attribute :rating, type: :object, on: :read, model_class: Ioki::Model::Passenger::Rating
        attribute :receipts, type: :array, on: [:read, :create, :update] # ???
        attribute :route, type: :object, model_class: Ioki::Model::Passenger::Route, on: [:read, :create, :update]
        attribute :state, type: :string, on: [:read, :create, :update]
        attribute :support_uri, type: :string, on: [:read, :create, :update]
        attribute :tip, type: :float, on: [:read, :create, :update] # ??
        attribute :tippable, type: :boolean, on: [:read, :create, :update]
        attribute :valid_for_driver_until, type: :date_time, on: [:read, :create, :update]
        attribute :valid_for_passenger_until, type: :date_time, on: [:read, :create, :update]
        attribute :vehicle, type: :object, model_class: Ioki::Model::Passenger::Vehicle, on: [:read, :create, :update]
        attribute :vehicle_reached_dropoff, type: :boolean, on: [:read, :create, :update]
        attribute :vehicle_reached_pickup, type: :boolean, on: [:read, :create, :update]
        attribute :version, type: :integer, on: [:read, :create, :update], omit_if_blank_on: [:create]
      end
    end
  end
end
