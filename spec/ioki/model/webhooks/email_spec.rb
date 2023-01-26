# frozen_string_literal: true

RSpec.describe Ioki::Model::Webhooks::Email do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }

  it { is_expected.to define_attribute(:confirmed).as(:boolean) }
  it { is_expected.to define_attribute(:email_address).as(:string) }
  it { is_expected.to define_attribute(:newsletter).as(:boolean) }
  it { is_expected.to define_attribute(:receipt).as(:boolean) }
end
