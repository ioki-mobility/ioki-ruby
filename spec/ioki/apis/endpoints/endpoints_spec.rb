# frozen_string_literal: true

RSpec.describe Endpoints do
  describe '.url_elements' do
    it 'creates a concrete path from one with placeholders and corresponding string args' do
      expect(described_class.url_elements('platform', [:id], 'RIDE_ID')).
        to eq ['RIDE_ID']
    end

    it 'keeps path fragments that are not meant to be interpolated' do
      expect(described_class.url_elements('platform', ['ride', :id], 'RIDE_ID')).
        to eq %w[ride RIDE_ID]
    end

    it 'calls the interpolation method on the given arguments' do
      expect(
        described_class.url_elements(
          'platform',
          ['ride', :id],
          instance_double(Ioki::Model::Platform::Ride, 'ride', id: 'RIDE_ID')
        )
      ).to eq %w[ride RIDE_ID]
    end

    it 'raises an error if the argument does not respond_to the interpolation method' do
      expect do
        described_class.url_elements(
          'platform',
          [:id],
          instance_double(Ioki::Model::Platform::RidePassenger, 'non_id_object')
        )
      end.to raise_error(ArgumentError, "#'platform': argument 1 must respond to :id or to be a string")
    end
  end
end
