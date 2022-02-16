# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::TaskList do
  describe 'new' do
    subject(:task_list) { described_class.new id: '123' }

    it { is_expected.to have_attributes(id: '123') }
    it { is_expected.to be_a(described_class) }
  end

  describe 'driver' do
    subject(:task_list) { described_class.new driver: { id: '123' } }

    it { is_expected.to have_attributes driver: have_attributes(id: '123') }
    it { is_expected.to have_attributes driver: be_a(Ioki::Model::Platform::Driver) }
  end

  describe 'vehicle' do
    subject(:task_list) { described_class.new vehicle: { id: '123', connected_driver_id: '123' } }

    it { is_expected.to have_attributes vehicle: have_attributes(id: '123') }
    it { is_expected.to have_attributes vehicle: have_attributes(connected_driver_id: '123') }
    it { is_expected.to have_attributes vehicle: be_a(Ioki::Model::Platform::Vehicle) }
  end

  describe 'start_place' do
    subject(:task_list) { described_class.new start_place: { id: '123' } }

    it { is_expected.to have_attributes start_place: have_attributes(id: '123') }
    it { is_expected.to have_attributes start_place: be_a(Ioki::Model::Platform::Place) }
  end

  describe 'end_place' do
    subject(:task_list) { described_class.new end_place: { id: '123' } }

    it { is_expected.to have_attributes end_place: have_attributes(id: '123') }
    it { is_expected.to have_attributes end_place: be_a(Ioki::Model::Platform::Place) }
  end

  describe 'matching_configuration' do
    subject(:task_list) { described_class.new matching_configuration: { id: '123' } }

    it { is_expected.to have_attributes matching_configuration: have_attributes(id: '123') }
    it { is_expected.to have_attributes matching_configuration: be_a(Ioki::Model::Platform::MatchingConfiguration) }
  end

  describe 'tasks' do
    subject(:task_list) { described_class.new tasks: [{ id: '123' }] }

    it { is_expected.to have_attributes tasks: all(have_attributes(id: '123')) }
    it { is_expected.to have_attributes tasks: all(be_a(Ioki::Model::Platform::Task)) }
  end

  describe 'pauses' do
    subject(:task_list) { described_class.new pauses: [{ id: '123' }] }

    it { is_expected.to have_attributes pauses: all(have_attributes(id: '123')) }
    it { is_expected.to have_attributes pauses: all(be_a(Ioki::Model::Platform::Pause)) }
  end

  describe 'deactivations' do
    subject(:task_list) { described_class.new deactivations: [{ id: '123' }] }

    it { is_expected.to have_attributes deactivations: all(have_attributes(id: '123')) }
    it { is_expected.to have_attributes deactivations: all(be_a(Ioki::Model::Platform::Deactivation)) }
  end
end
