# frozen_string_literal: true

RSpec.describe Ioki::Model::Webhooks::TaskList do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }

  it { is_expected.to define_attribute(:actual_ends_at).as(:date_time) }
  it { is_expected.to define_attribute(:actual_starts_at).as(:date_time) }
  it { is_expected.to define_attribute(:deactivated).as(:boolean) }
  it { is_expected.to define_attribute(:planned_ends_at).as(:date_time) }
  it { is_expected.to define_attribute(:planned_starts_at).as(:date_time) }
  it { is_expected.to define_attribute(:product_id).as(:string) }
  it { is_expected.to define_attribute(:state).as(:string) }
  it { is_expected.to define_attribute(:current_journey).as(:object).with(class_name: 'Journey') }
  it { is_expected.to define_attribute(:deactivations).as(:array).with(class_name: 'Deactivation') }
  it { is_expected.to define_attribute(:driver).as(:object).with(class_name: 'Driver') }
  it { is_expected.to define_attribute(:end_place).as(:object).with(class_name: 'Place') }
  it { is_expected.to define_attribute(:pauses).as(:array).with(class_name: 'Pause') }
  it { is_expected.to define_attribute(:start_place).as(:object).with(class_name: 'Place') }
  it { is_expected.to define_attribute(:tasks).as(:array).with(class_name: 'Task') }
  it { is_expected.to define_attribute(:vehicle).as(:object).with(class_name: 'Vehicle') }
end
