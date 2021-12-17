# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::Task do
  it 'returns a Ioki::Model::Platform::Ride for the :ride attribute' do
    expect(described_class.new(ride: { id: '123' }).ride).to be_a Ioki::Model::Platform::Ride
  end
end
