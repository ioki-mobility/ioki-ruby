# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::GeocodingSearchDetails do
  it { is_expected.to define_attribute(:type).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:id).as(:string).with(on: :create) }
  it { is_expected.to define_attribute(:vendor_id).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:vendor).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:vendor_type).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:location_name).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:formatted_address).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:street_name).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:street_number).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:postal_code).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:city).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:county).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:country).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:lat).as(:float).with(on: :read) }
  it { is_expected.to define_attribute(:lng).as(:float).with(on: :read) }
end
