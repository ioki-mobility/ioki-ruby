# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::MatchingLog do
  it { is_expected.to define_attribute(:dt).as(:integer) }
  it { is_expected.to define_attribute(:log_level).as(:integer) }
  it { is_expected.to define_attribute(:message).as(:string) }
end
