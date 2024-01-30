# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::ResourceConfiguration do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:default).as(:boolean) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:seats).as(:integer) }
  it { is_expected.to define_attribute(:storage_spaces).as(:integer) }
  it { is_expected.to define_attribute(:walker_bays).as(:integer) }
  it { is_expected.to define_attribute(:wheelchair_bays).as(:integer) }
end
