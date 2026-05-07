# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::RideTemplate do
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:passengers).as(:array).with(class_name: 'RidePassenger') }
end
