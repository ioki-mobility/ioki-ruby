# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::RidePassenger do
  it "serializes 'type' for :create" do
    expect(described_class.new(type: :adult).serialize(:create)[:type]).to eq 'adult'
  end
end
