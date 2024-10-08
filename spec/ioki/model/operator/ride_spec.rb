# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Ride do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:version).as(:integer) }
  it { is_expected.to define_attribute(:book_for_others).as(:boolean) }
  it { is_expected.to define_attribute(:booking).as(:object).with(class_name: 'Booking') }
  it { is_expected.to define_attribute(:cancellable).as(:boolean) }
  it { is_expected.to define_attribute(:cancellation_reason).as(:string) }
  it { is_expected.to define_attribute(:cancellation_reason_translated).as(:string) }
  it { is_expected.to define_attribute(:cancellation_statement).as(:object).with(class_name: 'CancellationStatement') }
  it { is_expected.to define_attribute(:creator_id).as(:string) }
  it { is_expected.to define_attribute(:creator_type).as(:string) }
  it { is_expected.to define_attribute(:destination).as(:object).with(class_name: 'RequestedPoint') }
  it { is_expected.to define_attribute(:driver).as(:object).with(class_name: 'Driver') }
  it { is_expected.to define_attribute(:driver_id).as(:string) }
  it { is_expected.to define_attribute(:driver_can_be_called).as(:boolean) }
  it { is_expected.to define_attribute(:dropoff).as(:object).with(class_name: 'CalculatedPoint') }
  it { is_expected.to define_attribute(:dropoff_task).as(:object).with(class_name: 'Task') }
  it { is_expected.to define_attribute(:estimated_direct_distance).as(:integer) }
  it { is_expected.to define_attribute(:estimated_direct_duration).as(:integer) }
  it { is_expected.to define_attribute(:needs_cancellation_code).as(:boolean) }
  it { is_expected.to define_attribute(:origin).as(:object).with(class_name: 'RequestedPoint') }
  it { is_expected.to define_attribute(:passenger_can_be_called).as(:boolean) }
  it { is_expected.to define_attribute(:passengers).as(:array).with(class_name: 'RidePassenger') }
  it { is_expected.to define_attribute(:passenger_note_to_driver).as(:string) }
  it { is_expected.to define_attribute(:payment_state).as(:string) }
  it { is_expected.to define_attribute(:pickup).as(:object).with(class_name: 'CalculatedPoint') }
  it { is_expected.to define_attribute(:pickup_task).as(:object).with(class_name: 'Task') }
  it { is_expected.to define_attribute(:prebooked).as(:boolean) }
  it { is_expected.to define_attribute(:product_id).as(:string) }
  it { is_expected.to define_attribute(:public_transport_uri).as(:string) }
  it { is_expected.to define_attribute(:rateable).as(:boolean) }
  it { is_expected.to define_attribute(:rating).as(:object).with(class_name: 'Rating') }
  it { is_expected.to define_attribute(:rematchable).as(:boolean) }
  it { is_expected.to define_attribute(:ride_series_id).as(:string) }
  it { is_expected.to define_attribute(:route).as(:object).with(class_name: 'Route') }
  it { is_expected.to define_attribute(:state).as(:string) }
  it { is_expected.to define_attribute(:storage_spaces).as(:integer) }
  it { is_expected.to define_attribute(:support_uri).as(:string) }
  it { is_expected.to define_attribute(:task_list_id).as(:string) }
  it { is_expected.to define_attribute(:tippable).as(:boolean) }
  it { is_expected.to define_attribute(:user).as(:object).with(class_name: 'User') }
  it { is_expected.to define_attribute(:user_id).as(:string) }
  it { is_expected.to define_attribute(:valid_for_driver_until).as(:date_time) }
  it { is_expected.to define_attribute(:valid_for_passenger_until).as(:date_time) }
  it { is_expected.to define_attribute(:vehicle).as(:object).with(class_name: 'Vehicle') }
  it { is_expected.to define_attribute(:vehicle_id).as(:string) }
  it { is_expected.to define_attribute(:vehicle_positions).as(:array).with(class_name: 'VehiclePosition') }
  it { is_expected.to define_attribute(:vehicle_reached_dropoff).as(:boolean) }
  it { is_expected.to define_attribute(:vehicle_reached_pickup).as(:boolean) }
end
