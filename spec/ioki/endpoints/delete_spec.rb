# frozen_string_literal: true

RSpec.describe Ioki::Endpoints::Delete do
  let(:model_class) { Ioki::Model::Platform::Product }
  let(:client)      { instance_double(Ioki::Client, 'client', build_request_url: 'url') }
  let(:endpoint)    { described_class.new('product', base_path: ['base_path'], model_class: model_class, send_body:) }
  let(:params)      { instance_double(Hash, 'params') }
  let(:response)    { { 'data' => { 'id' => '0815' } } }

  shared_examples 'delete endpoint request and response' do
    it 'calls #request on the client instantiating a class from the result' do
      expect(client).to receive(:request).with(
        url:    'url',
        method: :delete,
        body:   nil,
        params: params
      ).and_return(response)

      result = endpoint.call(client, model, ['0815'], params: params)

      expect(result).to be_a(Ioki::Model::Platform::Product)
      expect(result.changes).to be_empty
      expect(result.id).to eq('0815')
    end
  end

  context 'when no model instance is passed' do
    let(:model) { nil }
    let(:serialized_model) { nil }

    context 'and send_body is false' do
      let(:send_body) { false }

      it_behaves_like 'delete endpoint request and response'
    end

    context 'and send_body is true' do
      let(:send_body) { true }

      it_behaves_like 'delete endpoint request and response'
    end

    context 'when the response body is empty' do
      let(:response) { nil }
      let(:send_body) { false }

      it 'returns nil' do
        expect(client).to receive(:request).with(
          url:    'url',
          method: :delete,
          body:   nil,
          params: params
        ).and_return(response)

        result = endpoint.call(client, model, ['0815'], params: params)

        expect(result).to be_nil
      end
    end
  end

  context 'when a model instance is passed' do
    let(:model) { Ioki::Model::Platform::Product.new }
    let(:serialized_model) { { name: 'To be deleted' } }
    let(:send_body) { true }

    before { allow(model).to receive(:serialize).with(:delete).and_return(serialized_model) }

    context 'and send_body is false' do
      let(:send_body) { false }

      it_behaves_like 'delete endpoint request and response'
    end

    context 'and send_body is true' do
      let(:send_body) { true }

      it 'is a shortcut calling #request, sending serialized modeldata and instantiating a new class from the result' do
        expect(client).to receive(:request).with(
          url:    'url',
          method: :delete,
          body:   { data: serialized_model },
          params: params
        ).and_return(response)

        result = endpoint.call(client, model, ['0815'], params: params)

        expect(result).to be_a(Ioki::Model::Platform::Product)
        expect(result.changes).to be_empty
        expect(result).not_to eq(model)
      end
    end
  end
end
