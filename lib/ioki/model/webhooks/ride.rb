# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Ride < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :version, type: :integer
        attribute :cancellation_reason, type: :string
        attribute :cancelled_at, type: :date_time
        attribute :driver_accepted_at, type: :date_time
        attribute :dropped_off_at, type: :date_time
        attribute :estimated_direct_distance, type: :integer
        attribute :estimated_direct_duration, type: :integer
        attribute :passenger_accepted_at, type: :date_time
        attribute :payment_state, type: :string
        attribute :picked_up_at, type: :date_time
        attribute :product_id, type: :string
        attribute :state, type: :string
        attribute :vehicle_approached_pickup_at, type: :date_time
        attribute :vehicle_reached_dropoff_at, type: :date_time
        attribute :vehicle_reached_pickup_at, type: :date_time
        attribute :booking, type: :object, class_name: 'Booking'
        attribute :cancellation_statement, type: :object, class_name: 'CancellationStatement'
        attribute :destination, type: :object, class_name: 'RequestedPoint'
        attribute :dropoff, type: :object, class_name: 'CalculatedPoint'
        attribute :dropoff_task, type: :object, class_name: 'NestedTask'
        attribute :fare, type: :object, class_name: 'Fare'
        attribute :origin, type: :object, class_name: 'RequestedPoint'
        attribute :passengers, type: :array
        attribute :payment_method, type: :object, class_name: 'PaymentMethod'
        attribute :pickup, type: :object, class_name: 'CalculatedPoint'
        attribute :pickup_task, type: :object, class_name: 'NestedTask'
        attribute :rating, type: :object, class_name: 'Rating'
        attribute :tip, type: :object, class_name: 'Tip'
        attribute :user, type: :object, class_name: 'User'
        attribute :vehicle, type: :object, class_name: 'Vehicle'
      end
    end
  end
end
