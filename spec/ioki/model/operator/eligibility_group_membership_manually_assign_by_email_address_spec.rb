# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::EligibilityGroupMembershipManuallyAssignByEmailAddress do
  it { is_expected.to define_attribute(:email_address).as(:string) }
  it { is_expected.to define_attribute(:user_segment_slug).as(:string) }
  it { is_expected.to define_attribute(:eligibility_group_slug).as(:string) }
end
