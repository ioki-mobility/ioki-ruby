# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::UserEmail do
  it { is_expected.to define_attribute(:email_address).as(:string) }
  it { is_expected.to define_attribute(:newsletter).as(:boolean) }
  it { is_expected.to define_attribute(:receipt).as(:boolean) }
end
