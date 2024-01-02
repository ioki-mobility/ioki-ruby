# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Driver do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:version).as(:integer) }
  it { is_expected.to define_attribute(:connected_vehicle_id).as(:string) }
  it { is_expected.to define_attribute(:display_name).as(:string) }
  it { is_expected.to define_attribute(:external_id).as(:string) }
  it { is_expected.to define_attribute(:first_name).as(:string) }
  it { is_expected.to define_attribute(:last_name).as(:string) }
  it { is_expected.to define_attribute(:locale).as(:string) }
  it { is_expected.to define_attribute(:locked_at).as(:date_time) }
  it { is_expected.to define_attribute(:operator_id).as(:string) }
  it { is_expected.to define_attribute(:password).as(:string) }
  it { is_expected.to define_attribute(:phone_number).as(:string) }
  it { is_expected.to define_attribute(:username).as(:string) }
end
