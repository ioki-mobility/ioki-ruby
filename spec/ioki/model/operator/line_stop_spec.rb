# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::LineStop do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:tier).as(:integer) }
  it { is_expected.to define_attribute(:relative_time).as(:integer) }
  it { is_expected.to define_attribute(:dropoff_mode).as(:string) }
  it { is_expected.to define_attribute(:pickup_mode).as(:string) }
  it { is_expected.to define_attribute(:supports_pickup).as(:boolean) }
  it { is_expected.to define_attribute(:supports_dropoff).as(:boolean) }
  it { is_expected.to define_attribute(:supports_pass_through).as(:boolean) }
  it { is_expected.to define_attribute(:station_id).as(:string) }
  it { is_expected.to define_attribute(:version).as(:integer) }
end
