# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::Task do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:ride).as(:object).with(class_name: 'Ride') }
end
