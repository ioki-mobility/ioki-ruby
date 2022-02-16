# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::Task do
  describe 'new' do
    subject(:task_list) { described_class.new id: '123' }

    it { is_expected.to have_attributes(id: '123') }
    it { is_expected.to be_a(described_class) }
  end

  describe 'calculated_point' do
    subject(:task_list) { described_class.new calculated_point: { id: '123' } }

    it { is_expected.to have_attributes calculated_point: have_attributes(id: '123') }
    it { is_expected.to have_attributes calculated_point: be_a(Ioki::Model::Platform::CalculatedPoint) }
  end

  describe 'pause' do
    subject(:task_list) { described_class.new pause: nil, pause_id: '123' }

    it { is_expected.to have_attributes pause_id: '123' }
    it { is_expected.not_to respond_to :pause }
  end

  describe 'ride' do
    subject(:task_list) { described_class.new ride: nil, ride_id: '123' }

    it { is_expected.to have_attributes ride_id: '123' }
    it { is_expected.not_to respond_to :ride }
  end
end
