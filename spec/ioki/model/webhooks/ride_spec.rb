# frozen_string_literal: true

RSpec.describe Ioki::Model::Webhooks::Ride do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }

  it { is_expected.to define_attribute(:version).as(:integer) }
  it { is_expected.to define_attribute(:cancellation_reason).as(:string) }
  it { is_expected.to define_attribute(:cancelled_at).as(:date_time) }
  it { is_expected.to define_attribute(:driver_accepted_at).as(:date_time) }
  it { is_expected.to define_attribute(:dropped_off_at).as(:date_time) }
  it { is_expected.to define_attribute(:estimated_direct_distance).as(:integer) }
  it { is_expected.to define_attribute(:estimated_direct_duration).as(:integer) }
  it { is_expected.to define_attribute(:passenger_accepted_at).as(:date_time) }
  it { is_expected.to define_attribute(:payment_state).as(:string) }
  it { is_expected.to define_attribute(:picked_up_at).as(:date_time) }
  it { is_expected.to define_attribute(:product_id).as(:string) }
  it { is_expected.to define_attribute(:state).as(:string) }
  it { is_expected.to define_attribute(:vehicle_approached_pickup_at).as(:date_time) }
  it { is_expected.to define_attribute(:vehicle_reached_dropoff_at).as(:date_time) }
  it { is_expected.to define_attribute(:vehicle_reached_pickup_at).as(:date_time) }
  it { is_expected.to define_attribute(:booking).as(:object).with(class_name: 'Booking') }
  it { is_expected.to define_attribute(:cancellation_statement).as(:object).with(class_name: 'CancellationStatement') }
  it { is_expected.to define_attribute(:destination).as(:object).with(class_name: 'RequestedPoint') }
  it { is_expected.to define_attribute(:dropoff).as(:object).with(class_name: 'CalculatedPoint') }
  it { is_expected.to define_attribute(:dropoff_task).as(:object).with(class_name: 'NestedTask') }
  it { is_expected.to define_attribute(:fare).as(:object).with(class_name: 'Fare') }
  it { is_expected.to define_attribute(:origin).as(:object).with(class_name: 'RequestedPoint') }
  it { is_expected.to define_attribute(:passengers).as(:array).with(class_name: 'RidePassenger') }
  it { is_expected.to define_attribute(:payment_method).as(:object).with(class_name: 'PaymentMethod') }
  it { is_expected.to define_attribute(:pickup).as(:object).with(class_name: 'CalculatedPoint') }
  it { is_expected.to define_attribute(:pickup_task).as(:object).with(class_name: 'NestedTask') }
  it { is_expected.to define_attribute(:rating).as(:object).with(class_name: 'Rating') }
  it { is_expected.to define_attribute(:tip).as(:object).with(class_name: 'Tip') }
  it { is_expected.to define_attribute(:user).as(:object).with(class_name: 'User') }
  it { is_expected.to define_attribute(:vehicle).as(:object).with(class_name: 'Vehicle') }
end
