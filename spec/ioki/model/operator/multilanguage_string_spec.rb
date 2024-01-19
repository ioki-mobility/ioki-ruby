# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::MultilanguageString do
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:translations).as(:array).with(class_name: 'Translation') }
end
