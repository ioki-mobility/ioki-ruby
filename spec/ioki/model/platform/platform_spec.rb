# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::Platform do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }

  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:locale).as(:string) }
  it { is_expected.to define_attribute(:timezone_identifier).as(:string) }
end
