# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::PhoneVerification do
  it { is_expected.to define_attribute(:phone_number).as(:string) }
  it { is_expected.to define_attribute(:code).as(:string) }
end
