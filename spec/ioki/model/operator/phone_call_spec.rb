# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::PhoneCall do
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:call_to_caller_sid).as(:string) }
  it { is_expected.to define_attribute(:call_to_caller_status).as(:string) }
  it { is_expected.to define_attribute(:call_to_caller_completed_at).as(:date_time) }
  it { is_expected.to define_attribute(:call_to_callee_sid).as(:string) }
  it { is_expected.to define_attribute(:call_to_callee_status).as(:string) }
  it { is_expected.to define_attribute(:call_to_callee_completed_at).as(:date_time) }
  it { is_expected.to define_attribute(:from_id).as(:string) }
  it { is_expected.to define_attribute(:to_id).as(:string) }
end
