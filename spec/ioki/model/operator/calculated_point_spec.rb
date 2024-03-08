# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::CalculatedPoint do
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:city).as(:string) }
  it { is_expected.to define_attribute(:communicated_time).as(:date_time) }
  it { is_expected.to define_attribute(:country).as(:string) }
  it { is_expected.to define_attribute(:county).as(:string) }
  it { is_expected.to define_attribute(:display_times).as(:array) }
  it { is_expected.to define_attribute(:fixed_location).as(:boolean) }
  it { is_expected.to define_attribute(:formatted_street).as(:string) }
  it { is_expected.to define_attribute(:lat).as(:float) }
  it { is_expected.to define_attribute(:lng).as(:float) }
  it { is_expected.to define_attribute(:location_name).as(:string) }
  it { is_expected.to define_attribute(:negotiation_time).as(:date_time) }
  it { is_expected.to define_attribute(:negotiation_time_max).as(:date_time) }
  it { is_expected.to define_attribute(:pause_id).as(:string) }
  it { is_expected.to define_attribute(:postal_code).as(:string) }
  it { is_expected.to define_attribute(:station_id).as(:string) }
  it { is_expected.to define_attribute(:street_name).as(:string) }
  it { is_expected.to define_attribute(:street_number).as(:string) }
  it { is_expected.to define_attribute(:time).as(:date_time) }
  it { is_expected.to define_attribute(:walking_duration).as(:integer) }
  it { is_expected.to define_attribute(:walking_track).as(:string) }
  it { is_expected.to define_attribute(:waypoint_type).as(:string) }
end
