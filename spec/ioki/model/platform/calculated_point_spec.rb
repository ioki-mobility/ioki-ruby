# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::CalculatedPoint do
  describe 'new' do
    subject(:task_list) { described_class.new id: '123' }
    it { is_expected.to have_attributes(id: '123') }
    it { is_expected.to be_a(described_class) }
  end

  describe 'station' do
    subject(:task_list) { described_class.new station: { id: '123' } }
    it { is_expected.to have_attributes station: have_attributes(id: '123') }
    it { is_expected.to have_attributes station: be_a(Ioki::Model::Platform::Station) }
  end
end
