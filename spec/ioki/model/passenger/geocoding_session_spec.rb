# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::GeocodingSession do
  it { is_expected.to define_attribute(:type).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:id).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:created_at).as(:date_time).with(on: :read) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time).with(on: :read) }
  it { is_expected.to define_attribute(:valid_until).as(:date_time).with(on: :read) }

  it { is_expected.to define_attribute(:product_id).as(:string).with(on: :create) }
end
