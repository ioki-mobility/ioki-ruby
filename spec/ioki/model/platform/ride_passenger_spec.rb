# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::RidePassenger do
  it { is_expected.to define_attribute(:type).as(:string).with(on: [:create, :update]) }
end
