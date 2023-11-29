# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Notification do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:body).as(:string) }
  it { is_expected.to define_attribute(:body_for_sms).as(:string) }
  it { is_expected.to define_attribute(:channels).as(:array) }
  it { is_expected.to define_attribute(:delivered_at).as(:date_time) }
  it { is_expected.to define_attribute(:notification_type).as(:string) }
end
