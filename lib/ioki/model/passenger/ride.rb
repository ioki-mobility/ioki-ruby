# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Ride < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :state, type: :string, on: :read
        attribute :origin, type: :object, on: [:create, :read], class_name: 'RequestedPoint'
        attribute :destination, type: :object, on: [:create, :read], class_name: 'RequestedPoint'
        attribute :passengers, type: :array, on: [:create, :read], class_name: 'RidePassenger'
        attribute :user, type: :object, on: :read, class_name: 'User'
        attribute :booking, type: :object, on: :read, class_name: 'Booking'
        attribute :pickup, type: :object, on: :read, class_name: 'CalculatedPoint'
        attribute :dropoff, type: :object, on: :read, class_name: 'CalculatedPoint'
        attribute :storage_spaces, type: :integer, on: [:read, :create, :update], omit_if_blank_on: [:create, :update]
        attribute :book_for_others, type: :boolean, on: [:read, :create, :update]
        attribute :cancellable, type: :boolean, on: [:read, :create, :update]
        attribute :cancellation_reason, type: :string, on: [:read, :create, :update]
        attribute :cancellation_reason_translated, type: :string, on: [:read, :create, :update]
        attribute :driver, type: :object, on: :read, class_name: 'Driver'
        attribute :driver_can_be_called, type: :boolean, on: [:read, :create, :update]
        attribute :needs_cancellation_code, type: :boolean, on: [:read, :create, :update]
        attribute :passenger_can_be_called, type: :boolean, on: [:read, :create, :update]
        attribute :payment_method, type: :object, on: :read, class_name: 'PaymentMethod'
        attribute :payment_state, type: :string, on: [:read, :create, :update]
        attribute :prebooked, type: :boolean, on: [:read, :create, :update]
        attribute :product_id, type: :string, on: [:read, :create, :update]
        attribute :public_transport_uri, type: :string, on: [:read, :create, :update]
        attribute :rateable, type: :boolean, on: [:read, :create, :update]
        attribute :rating, type: :object, on: :read, class_name: 'Rating'
        attribute :receipts, type: :array, on: [:read, :create, :update]
        attribute :route, type: :object, class_name: 'Route', on: [:read, :create, :update]
        attribute :state, type: :string, on: [:read, :create, :update]
        attribute :support_uri, type: :string, on: [:read, :create, :update]
        attribute :tip, type: :object, class_name: 'Tip', on: [:read, :create, :update]
        attribute :tippable, type: :boolean, on: [:read, :create, :update]
        attribute :valid_for_driver_until, type: :date_time, on: [:read, :create, :update]
        attribute :valid_for_passenger_until, type: :date_time, on: [:read, :create, :update]
        attribute :vehicle, type: :object, class_name: 'Vehicle', on: [:read, :create, :update]
        attribute :vehicle_reached_dropoff, type: :boolean, on: [:read, :create, :update]
        attribute :vehicle_reached_pickup, type: :boolean, on: [:read, :create, :update]
        attribute :version, type: :integer, on: [:read, :update]
        attribute :fare, on: :read, type: :object, class_name: 'Fare'
        attribute :ticket, on: :read, type: :object, class_name: 'Ticket'
        attribute :offered_solutions, on: :read, type: :array, class_name: 'OfferedSolution'
      end
    end
  end
end
