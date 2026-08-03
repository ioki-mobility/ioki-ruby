# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::GeocodingSearchResult do
  it { is_expected.to define_attribute(:type).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:id).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:vendor_id).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:vendor).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:formatted_address).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:description).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:location_name).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:lat).as(:float).with(on: :read) }
  it { is_expected.to define_attribute(:lng).as(:float).with(on: :read) }
  it { is_expected.to define_attribute(:result_type).as(:string).with(on: :read) }
end
