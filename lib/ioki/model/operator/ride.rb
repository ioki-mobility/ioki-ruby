# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Ride < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :state,          type: :string,  on: :read
        attribute :origin,         type: :object,  on: [:create, :read], class_name: 'RequestedPoint'
        attribute :destination,    type: :object,  on: [:create, :read], class_name: 'RequestedPoint'
        attribute :passengers,     type: :array,   on: [:create, :read], class_name: 'RidePassenger'
        # The model does not return it but it's used when sending data to the server.
        attribute :user_id,        type: :string,  on: [:create, :update], unvalidated: true
        attribute :product_id,     type: :string,  on: [:read, :create, :update]
        attribute :user,           type: :object,  on: :read, class_name: 'User'
        attribute :version,        type: :integer, on: [:read, :update]
        attribute :booking,        type: :object,  on: :read, class_name: 'Booking'
        attribute :pickup,         type: :object,  on: :read, class_name: 'CalculatedPoint'
        attribute :dropoff,        type: :object,  on: :read, class_name: 'CalculatedPoint'
        attribute :storage_spaces, type: :integer, on: [:read, :create, :update], omit_if_blank_on: [:create, :update]
        attribute :rating,         type: :object,  on: :read, class_name: 'Rating'
        attribute :book_for_others, on: :read, type: :boolean
        attribute :cancellable, on: :read, type: :boolean
        attribute :cancellation_reason, on: :read, type: :string
        attribute :cancellation_reason_translated, on: :read, type: :string
        attribute :driver, on: :read, type: :object, class_name: 'Driver'
        attribute :driver_can_be_called, on: :read, type: :boolean
        attribute :dropoff_task, on: :read, type: :object, class_name: 'Task'
        attribute :estimated_direct_distance, on: :read, type: :integer
        attribute :estimated_direct_duration, on: :read, type: :integer
        attribute :fare, on: :read, type: :object, class_name: 'Fare'
        attribute :needs_cancellation_code, on: :read, type: :boolean
        attribute :passenger_can_be_called, on: :read, type: :boolean
        attribute :payment_method, on: :read, type: :object, class_name: 'PaymentMethod'
        attribute :payment_state, on: :read, type: :string
        attribute :pickup_task, on: :read, type: :object, class_name: 'Task'
        attribute :prebooked, on: :read, type: :boolean
        attribute :public_transport_uri, on: :read, type: :string
        attribute :rateable, on: :read, type: :boolean
        attribute :receipts, on: :read, type: :array, class_name: 'Receipt'
        attribute :route, on: :read, type: :object, class_name: 'Route'
        attribute :support_uri, on: :read, type: :string
        attribute :tippable, on: :read, type: :boolean
        attribute :valid_for_driver_until, on: :read, type: :string
        attribute :valid_for_passenger_until, on: :read, type: :string
        attribute :vehicle, on: :read, type: :object, class_name: 'Vehicle'
        attribute :vehicle_reached_dropoff, on: :read, type: :boolean
        attribute :vehicle_reached_pickup, on: :read, type: :boolean
      end
    end
  end
end
