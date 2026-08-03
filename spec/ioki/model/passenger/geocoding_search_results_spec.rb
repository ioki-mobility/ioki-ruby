# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::GeocodingSearchResults do
  it { is_expected.to define_attribute(:type).as(:string).with(on: :read) }

  it do
    is_expected.to define_attribute(:results)
      .as(:array)
      .with(on: :read, class_name: 'Ioki::Model::Passenger::GeocodingSearchResult')
  end
end
