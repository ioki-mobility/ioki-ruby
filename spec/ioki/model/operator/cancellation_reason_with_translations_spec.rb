# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::CancellationReasonWithTranslations do
  it { is_expected.to define_attribute(:slug).as(:string) }
  it { is_expected.to define_attribute(:translations).as(:object).with(class_name: 'MultilanguageString') }
end
