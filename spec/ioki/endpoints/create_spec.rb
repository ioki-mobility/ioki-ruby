# frozen_string_literal: true

RSpec.describe Ioki::Endpoints::Create do
  let(:url)              { URI.parse('www.example.org') }
  let(:model_class)      { Ioki::Model::Platform::Product }
  let(:model)            { Ioki::Model::Platform::Product.new }
  let(:client)           { instance_double(Ioki::Client, 'client', build_request_url: url) }
  let(:endpoint)         { described_class.new('product', base_path: ['base'], model_class: model_class) }
  let(:params)           { instance_double(Hash, 'params') }
  let(:serialized_model) { { name: 'Test' } }

  before { allow(model).to receive(:serialize).with(:create).and_return(serialized_model) }

  describe '#call' do
    it 'calls #request on the client, sending serialized modeldata and instantiating a new class from the result' do
      expect(client).to receive(:request).with(
        url:    url,
        method: :post,
        body:   { data: serialized_model },
        params: params
      ).and_return(
        [
          { 'data' => { 'id' => '0815', name: 'attributes altered by server' } },
          instance_double(Faraday::Response, headers: { etag: 'ETAG' })
        ]
      )

      result = endpoint.call(client, model, [], params: params)

      expect(result).to be_kind_of(Ioki::Model::Platform::Product)
      expect(result).not_to eq(model)
      expect(result.id).to eq('0815')
      expect(result.name).to eq('attributes altered by server')
      expect(result._etag).to eq('ETAG')
    end

    context 'when the passed model instance has the wrong class' do
      let(:model) { Ioki::Model::Platform::Station.new }

      it 'raises' do
        expect { endpoint.call(client, model, []) }.to raise_error(
          ArgumentError,
          "#{model} is not an instance of #{Ioki::Model::Platform::Product}"
        )
      end
    end
  end

  it 'supports an array as a path' do
    endpoint = described_class.new(
      'ride',
      base_path:   ['passenger'],
      path:        ['rides', 'current'],
      model_class: model_class
    )

    expect(endpoint.full_path).to eq(['passenger', 'rides', 'current'])
  end
end
