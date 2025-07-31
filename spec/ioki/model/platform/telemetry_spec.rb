# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::Telemetry do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:altitude).as(:float) }
  it { is_expected.to define_attribute(:altitude_source).as(:string) }
  it { is_expected.to define_attribute(:altitude_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:battery_level).as(:float) }
  it { is_expected.to define_attribute(:battery_level_source).as(:string) }
  it { is_expected.to define_attribute(:battery_level_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:charging_state).as(:string) }
  it { is_expected.to define_attribute(:charging_state_source).as(:string) }
  it { is_expected.to define_attribute(:charging_state_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:door_state).as(:string) }
  it { is_expected.to define_attribute(:door_state_source).as(:string) }
  it { is_expected.to define_attribute(:door_state_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:estimated_time_until_full_recharge).as(:float) }
  it { is_expected.to define_attribute(:estimated_time_until_full_recharge_source).as(:string) }
  it { is_expected.to define_attribute(:estimated_time_until_full_recharge_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:heading).as(:float) }
  it { is_expected.to define_attribute(:heading_source).as(:string) }
  it { is_expected.to define_attribute(:heading_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:lat).as(:float) }
  it { is_expected.to define_attribute(:lat_source).as(:string) }
  it { is_expected.to define_attribute(:lat_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:lng).as(:float) }
  it { is_expected.to define_attribute(:lng_source).as(:string) }
  it { is_expected.to define_attribute(:lng_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:mobileye_mission_state).as(:string) }
  it { is_expected.to define_attribute(:mobileye_mission_state_source).as(:string) }
  it { is_expected.to define_attribute(:mobileye_mission_state_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:mobileye_sds_state).as(:string) }
  it { is_expected.to define_attribute(:mobileye_sds_state_source).as(:string) }
  it { is_expected.to define_attribute(:mobileye_sds_state_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:people_count).as(:integer) }
  it { is_expected.to define_attribute(:people_count_source).as(:string) }
  it { is_expected.to define_attribute(:people_count_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:remaining_distance).as(:float) }
  it { is_expected.to define_attribute(:remaining_distance_source).as(:string) }
  it { is_expected.to define_attribute(:remaining_distance_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:seatbelt_state).as(:string) }
  it { is_expected.to define_attribute(:speed).as(:float) }
  it { is_expected.to define_attribute(:speed_source).as(:string) }
  it { is_expected.to define_attribute(:speed_synced_at).as(:date_time) }
  it { is_expected.to define_attribute(:tires_pressure).as(:array) }
  it { is_expected.to define_attribute(:tires_pressure_source).as(:string) }
  it { is_expected.to define_attribute(:tires_pressure_synced_at).as(:date_time) }
end
