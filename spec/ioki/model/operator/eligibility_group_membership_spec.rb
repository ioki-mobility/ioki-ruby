# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::EligibilityGroupMembership do
  it { is_expected.to define_attribute(:eligibility_group_slug).as(:string) }
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:user_id).as(:string) }
  it { is_expected.to define_attribute(:state).as(:string) }
  it { is_expected.to define_attribute(:active_strategies).as(:array) }
  it { is_expected.to define_attribute(:activated_at).as(:date_time) }
end
