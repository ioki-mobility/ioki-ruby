# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::Support do
  describe 'camelize' do
    it 'works for lowercase strings' do
      expect(described_class.camelize('task')).to eq('Task')
    end

    it 'works for underscored strings' do
      expect(described_class.camelize('task_list')).to eq('TaskList')
    end

    it 'works for multiple underscored strings' do
      expect(described_class.camelize('driver_vehicle_connection')).to eq('DriverVehicleConnection')
    end

    it 'works for empty strings' do
      expect(described_class.camelize('')).to eq('')
    end

    it 'works for nil' do
      expect(described_class.camelize(nil)).to eq('')
    end
  end
end
