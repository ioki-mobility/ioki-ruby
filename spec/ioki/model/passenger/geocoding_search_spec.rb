# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::GeocodingSearch do
  it { is_expected.to define_attribute(:query).as(:string).with(on: :create) }
  it { is_expected.to define_attribute(:product_id).as(:string).with(on: :create) }
  it { is_expected.to define_attribute(:place_types).as(:string).with(on: :create) }
  it { is_expected.to define_attribute(:result_types).as(:array).with(on: :create) }
end
