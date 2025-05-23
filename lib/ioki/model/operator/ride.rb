# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Ride < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :version,
                  on:   :read,
                  type: :integer

        attribute :book_for_others,
                  on:   :read,
                  type: :boolean

        attribute :booked_solution,
                  on:         :read,
                  type:       :object,
                  class_name: 'OfferedSolution'

        attribute :booking,
                  on:         :read,
                  type:       :object,
                  class_name: 'Booking'

        attribute :cancellable,
                  on:   :read,
                  type: :boolean

        attribute :cancellation_reason,
                  on:   :read,
                  type: :string

        attribute :cancellation_reason_translated,
                  on:   :read,
                  type: :string

        attribute :cancellation_statement,
                  on:         :read,
                  type:       :object,
                  class_name: 'CancellationStatement'

        attribute :cancelled_at,
                  on:   :read,
                  type: :date_time

        attribute :canceller,
                  on:   :read,
                  type: :string

        attribute :creator_id,
                  on:   :read,
                  type: :string

        attribute :creator_type,
                  on:   :read,
                  type: :string

        attribute :destination,
                  on:         :read,
                  type:       :object,
                  class_name: 'RequestedPoint'

        attribute :driver,
                  on:         :read,
                  type:       :object,
                  class_name: 'Driver'

        attribute :driver_id,
                  on:   :read,
                  type: :string

        attribute :driver_can_be_called,
                  on:   :read,
                  type: :boolean

        attribute :dropoff,
                  on:         :read,
                  type:       :object,
                  class_name: 'CalculatedPoint'

        attribute :dropped_off_at,
                  on:   :read,
                  type: :date_time

        attribute :dropoff_task,
                  on:         :read,
                  type:       :object,
                  class_name: 'Task'

        attribute :estimated_direct_distance,
                  on:   :read,
                  type: :integer

        attribute :estimated_direct_duration,
                  on:   :read,
                  type: :integer

        attribute :last_serving_driver,
                  on:         :read,
                  type:       :object,
                  class_name: 'Driver'

        attribute :last_serving_driver_id,
                  on:   :read,
                  type: :string

        attribute :needs_cancellation_code,
                  on:   :read,
                  type: :boolean

        attribute :offered_solutions,
                  on:         :read,
                  type:       :array,
                  class_name: 'OfferedSolution'

        attribute :origin,
                  on:         :read,
                  type:       :object,
                  class_name: 'RequestedPoint'

        attribute :passenger_can_be_called,
                  on:   :read,
                  type: :boolean

        attribute :passengers,
                  on:         :read,
                  type:       :array,
                  class_name: 'RidePassenger'

        attribute :passenger_note_to_driver,
                  on:   :read,
                  type: :string

        attribute :payment_state,
                  on:   :read,
                  type: :string

        attribute :picked_up_at,
                  on:   :read,
                  type: :date_time

        attribute :pickup,
                  on:         :read,
                  type:       :object,
                  class_name: 'CalculatedPoint'

        attribute :pickup_task,
                  on:         :read,
                  type:       :object,
                  class_name: 'Task'

        attribute :prebooked,
                  on:   :read,
                  type: :boolean

        attribute :product_id,
                  on:   :read,
                  type: :string

        attribute :public_transport_uri,
                  on:   :read,
                  type: :string

        attribute :rateable,
                  on:   :read,
                  type: :boolean

        attribute :rating,
                  on:         :read,
                  type:       :object,
                  class_name: 'Rating'

        attribute :rematchable,
                  on:   :read,
                  type: :boolean

        attribute :ride_series_id,
                  on:   :read,
                  type: :string

        attribute :route,
                  on:         :read,
                  type:       :object,
                  class_name: 'Route'

        attribute :state,
                  on:   :read,
                  type: :string

        attribute :storage_spaces,
                  on:   :read,
                  type: :integer

        attribute :support_uri,
                  on:   :read,
                  type: :string

        attribute :task_list_id,
                  on:   :read,
                  type: :string

        attribute :tippable,
                  on:   :read,
                  type: :boolean

        attribute :user,
                  on:         :read,
                  type:       :object,
                  class_name: 'User'

        attribute :user_id,
                  on:   :read,
                  type: :string

        attribute :valid_for_driver_until,
                  on:   :read,
                  type: :date_time

        attribute :valid_for_passenger_until,
                  on:   :read,
                  type: :date_time

        attribute :vehicle,
                  on:         :read,
                  type:       :object,
                  class_name: 'Vehicle'

        attribute :vehicle_approached_dropoff_at,
                  on:   :read,
                  type: :date_time

        attribute :vehicle_approached_pickup_at,
                  on:   :read,
                  type: :date_time

        attribute :vehicle_id,
                  on:   :read,
                  type: :string

        attribute :vehicle_positions,
                  on:         :read,
                  type:       :array,
                  class_name: 'VehiclePosition'

        attribute :vehicle_reached_dropoff,
                  on:   :read,
                  type: :boolean

        attribute :vehicle_reached_dropoff_at,
                  on:   :read,
                  type: :date_time

        attribute :vehicle_reached_pickup,
                  on:   :read,
                  type: :boolean

        attribute :vehicle_reached_pickup_at,
                  on:   :read,
                  type: :date_time
      end
    end
  end
end
