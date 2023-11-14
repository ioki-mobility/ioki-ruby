# frozen_string_literal: true

RSpec.describe Ioki::Endpoints do
  describe '.url_elements' do
    it 'creates a concrete path from one with placeholders and corresponding string args' do
      expect(described_class.url_elements([:id], 'RIDE_ID')).to eq ['RIDE_ID']
    end

    it 'keeps path fragments that are not meant to be interpolated' do
      expect(described_class.url_elements(['ride', :id], 'RIDE_ID')).to eq %w[ride RIDE_ID]
    end

    it 'calls the interpolation method on the given arguments' do
      expect(
        described_class.url_elements(['ride', :id], instance_double(Ioki::Model::Platform::Ride, 'ride', id: 'RIDE_ID'))
      ).to eq %w[ride RIDE_ID]
    end

    it 'raises an error if the argument does not respond_to the interpolation method' do
      expect { described_class.url_elements([:id], 1) }
        .to raise_error(NoMethodError, /undefined method `id' for 1:Integer/)
    end

    it 'raises an error if the path consists of something else than Strings and Symbols' do
      expect { described_class.url_elements([1], 'RIDE_ID') }
        .to raise_error(ArgumentError, 'path: must consist of Strings and Symbols only')
    end

    context 'with more interpolation variables in the path than given arguments' do
      let(:path) { [:id, :ride_id] }

      it 'raises an argument error' do
        expect { described_class.url_elements(path, 'RIDE_ID') }
          .to raise_error(
            ArgumentError,
            'args: must have an argument for every symbol in :path. path: [:id, :ride_id], args: ["RIDE_ID"]'
          )
      end
    end
  end

  describe '.crud_endpoints' do
    subject do
      described_class.crud_endpoints(
        :rides,
        base_path:   ['/api'],
        model_class: Ioki::Model::Platform::Ride,
        **arguments
      )
    end

    context 'with `except`' do
      let(:arguments) { { except: [:index, :create] } }

      it 'filters actions included in `except`' do
        expect(subject).to match_array [
          kind_of(Ioki::Endpoints::Show),
          kind_of(Ioki::Endpoints::Update),
          kind_of(Ioki::Endpoints::Delete)
        ]
      end
    end

    context 'with `only`' do
      let(:arguments) { { only: [:index, :create] } }

      it 'filters actions not included in `only`' do
        expect(subject).to match_array [
          kind_of(Ioki::Endpoints::Index),
          kind_of(Ioki::Endpoints::Create)
        ]
      end
    end

    context 'with invalid options' do
      let(:arguments) { { only: [:index], except: [:show] } }

      it 'raises an error' do
        expect { subject }.to raise_error ArgumentError
      end
    end
  end
end
