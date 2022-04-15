# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Ride < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :version, on: :read, type: :integer
        attribute :book_for_others, on: :read, type: :boolean
        attribute :cancellable, on: :read, type: :boolean
        attribute :cancellation_reason, on: :read, type: :string
        attribute :cancellation_reason_translated, on: :read, type: :string
        attribute :driver_can_be_called, on: :read, type: :boolean
        attribute :driver_can_add_passenger, on: :read, type: :boolean
        attribute :needs_cancellation_code, on: :read, type: :boolean
        attribute :passenger_can_be_called, on: :read, type: :boolean
        attribute :payment_state, on: :read, type: :string
        attribute :prebooked, on: :read, type: :boolean
        attribute :product_id, on: :read, type: :string
        attribute :public_transport_uri, on: :read, type: :string
        attribute :rateable, on: :read, type: :boolean
        attribute :route, on: :read, type: :object
        attribute :state, on: :read, type: :string
        attribute :storage_spaces, on: :read, type: :integer
        attribute :tippable, on: :read, type: :boolean
        attribute :valid_for_driver_until, on: :read, type: :date_time
        attribute :valid_for_passenger_until, on: :read, type: :date_time
        attribute :vehicle_reached_dropoff, on: :read, type: :boolean
        attribute :vehicle_reached_pickup, on: :read, type: :boolean
        attribute :booking, on: :read, type: :object, class_name: 'Booking'
        attribute :destination, on: :read, type: :object, class_name: 'RequestedPoint'
        attribute :driver, on: :read, type: :object, class_name: 'Driver'
        attribute :dropoff, on: :read, type: :object, class_name: 'CalculatedPoint'
        attribute :fare, on: :read, type: :object, class_name: 'Fare'
        attribute :origin, on: :read, type: :object, class_name: 'RequestedPoint'
        attribute :passengers, on: :read, type: :array, class_name: 'RidePassenger'
        attribute :payment_method, on: :read, type: :object, class_name: 'PaymentMethod'
        attribute :pickup, on: :read, type: :object, class_name: 'CalculatedPoint'
        attribute :rating, on: :read, type: :object, class_name: 'Rating'
        attribute :ticket, on: :read, type: :object, class_name: 'Ticket'
        attribute :user, on: :read, type: :object, class_name: 'User'
        attribute :vehicle, on: :read, type: :object, class_name: 'Vehicle'
      end
    end
  end
end
