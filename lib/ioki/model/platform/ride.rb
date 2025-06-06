# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Ride < Base
        attribute :phone_calls, type: :array, on: [:create, :read, :update]
        attribute :cancellation_statement, type: :object, on: [:create, :read, :update], class_name: 'CancellationStatement'
        attribute :last_serving_driver_id, type: :string, on: [:create, :read, :update]
        attribute :passenger_note_to_driver, type: :string, on: [:create, :read, :update]
        attribute :ride_series_id, type: :string, on: [:create, :read, :update]
        attribute :creator_type, type: :string, on: [:create, :read, :update]
        attribute :creator_id, type: :string, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        deprecated_attribute :book_for_others, on: [:read, :create, :update], type: :boolean
        attribute :booking, type: :object, on: :read, class_name: 'Booking'
        attribute :cancellable, on: :read, type: :boolean
        attribute :cancellation_reason, on: :read, type: :string
        attribute :cancellation_reason_translated, on: :read, type: :string
        attribute :destination, type: :object, on: [:create, :read], class_name: 'RequestedPoint'
        attribute :driver, on: :read, type: :object, class_name: 'Driver'
        attribute :driver_can_be_called, on: :read, type: :boolean
        attribute :dropoff, type: :object,  on: :read, class_name: 'CalculatedPoint'
        attribute :dropoff_task, on: :read, type: :object, class_name: 'Task'
        attribute :estimated_direct_distance, on: :read, type: :integer
        attribute :estimated_direct_duration, on: :read, type: :integer
        attribute :fare, on: :read, type: :object, class_name: 'Fare'
        attribute :needs_cancellation_code, on: :read, type: :boolean
        attribute :options, type: :array, on: [:create, :read], class_name: 'RideOption'
        attribute :origin, type: :object, on: [:create, :read], class_name: 'RequestedPoint'
        attribute :passenger_can_be_called, on: :read, type: :boolean
        attribute :passengers, type: :array, on: [:create, :read], class_name: 'RidePassenger'
        attribute :payment_method, on: :read, type: :object, class_name: 'PaymentMethod'
        deprecated_attribute :payment_state, on: :read, type: :string
        attribute :pickup, type: :object,  on: :read, class_name: 'CalculatedPoint'
        attribute :pickup_task, on: :read, type: :object, class_name: 'Task'
        attribute :prebooked, on: :read, type: :boolean
        attribute :product_id, type: :string,  on: :read
        attribute :public_transport_uri, on: :read, type: :string
        attribute :rateable, on: :read, type: :boolean
        attribute :rating, type: :object, on: :read, class_name: 'Rating'
        deprecated_attribute :receipts, on: :read, type: :array, class_name: 'Receipt'
        attribute :route, on: :read, type: :object, class_name: 'Route'
        attribute :state, type: :string, on: :read
        deprecated_attribute :storage_spaces, type: :integer, on: [:read, :create, :update], omit_if_blank_on: [:create, :update]
        attribute :support_uri, on: :read, type: :string
        attribute :tippable, on: :read, type: :boolean
        attribute :user, type: :object, on: :read, class_name: 'User'
        attribute :user_id, type: :string, on: [:create, :update], unvalidated: true
        attribute :valid_for_driver_until, on: :read, type: :string
        attribute :valid_for_passenger_until, on: :read, type: :string
        attribute :vehicle, on: :read, type: :object, class_name: 'Vehicle'
        attribute :vehicle_reached_dropoff, on: :read, type: :boolean
        attribute :vehicle_reached_pickup, on: :read, type: :boolean
        attribute :version, type: :integer, on: [:read, :update]
      end
    end
  end
end
