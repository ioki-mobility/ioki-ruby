# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Translation do
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:language).as(:string) }
  it { is_expected.to define_attribute(:text).as(:string) }
end
