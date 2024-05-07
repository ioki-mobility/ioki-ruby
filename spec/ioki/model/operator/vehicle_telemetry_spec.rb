# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::VehicleTelemetry do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:battery_level).as(:float) }
  it { is_expected.to define_attribute(:remaining_distance).as(:float) }
  it { is_expected.to define_attribute(:charging_state).as(:string) }
  it { is_expected.to define_attribute(:estimated_time_until_full_recharge).as(:float) }
  it { is_expected.to define_attribute(:last_synced_at).as(:date_time) }
end
