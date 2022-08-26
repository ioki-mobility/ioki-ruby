# frozen_string_literal: true

RSpec.describe Ioki::Endpoints::Update do
  describe '#call' do
    let(:url)         { URI.parse('www.example.org') }
    let(:model_class) { Ioki::Model::Platform::Product }
    let(:model)       { Ioki::Model::Platform::Product.new }
    let(:serialized_model) { { name: 'Test' } }

    let(:endpoint) { described_class.new('product', base_path: ['base'], model_class: model_class) }
    let(:client)   { instance_double(Ioki::Client, 'client', build_request_url: url) }
    let(:params)   { instance_double(Hash, 'params') }

    before { allow(model).to receive(:serialize).with(:update).and_return(serialized_model) }

    it 'is a shortcut calling #request, sending serialized modeldata and instantiating a new class from the result' do
      expect(client).to receive(:request).with(
        url:    url,
        method: :patch,
        body:   { data: serialized_model },
        params: params
      ).and_return(
        [
          { 'data' => { 'id' => '0815', name: 'attributes altered by server' } },
          instance_double(Faraday::Response, headers: { etag: 'ETAG' })
        ]
      )

      result = endpoint.call(client, model, ['0815'], model_class: model_class, params: params)

      expect(result).to be_kind_of(Ioki::Model::Platform::Product)
      expect(result).not_to eq(model)
      expect(result.id).to eq('0815')
      expect(result.name).to eq('attributes altered by server')
      expect(result._etag).to eq('ETAG')
    end

    context 'when the passed model instance has the wrong class' do
      let(:model) { Ioki::Model::Platform::Station.new }

      it 'raises' do
        expect { endpoint.call(client, model, [model_class: model_class, model: model]) }.to raise_error(
          ArgumentError,
          "#{model} is not an instance of #{Ioki::Model::Platform::Product}"
        )
      end
    end
  end
end