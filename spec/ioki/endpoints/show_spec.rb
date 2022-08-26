# frozen_string_literal: true

RSpec.describe Ioki::Endpoints::Show do
  let(:url)         { URI.parse('www.example.org') }
  let(:model_class) { Ioki::Model::Platform::Product }
  let(:parsed_data) { { 'data' => { 'id' => '0815' } } }
  let(:response) do
    instance_double(
      Faraday::Response,
      'response double',
      status:  200,
      body:    { data: { id: '0815' } },
      headers: { etag: 'ETAG' }
    )
  end
  let(:endpoint) { described_class.new('product', base_path: ['base'], model_class: model_class) }
  let(:client)   { instance_double(Ioki::Client, 'client', build_request_url: url) }
  let(:params)   { instance_double(Hash, 'params') }

  it 'calls #request on the client and instantiates a class from the result' do
    expect(client).to receive(:request).with(
      hash_including(
        url:    url,
        params: params
      )
    ).and_return([parsed_data, response])

    result = endpoint.call(client, ['0815'], { params: params })

    expect(result).to be_kind_of(model_class)
    expect(result.id).to eq('0815')
  end

  it "sets the response's etag to the model" do
    allow(client).to receive(:request).and_return([parsed_data, response])

    expect(endpoint.call(client, ['0815'])._etag).to eq 'ETAG'
  end

  context 'with a model that has an etag' do
    let(:model) { Ioki::Model::Platform::Product.new }

    before { model._etag = 'ETAG' }

    it "passes on model'the s etag to the request method via headers" do
      expect(client).to receive(:request).with(
        url:     url,
        headers: { 'If-None-Match': model._etag },
        params:  params
      ).and_return([parsed_data, response])

      endpoint.call(client, ['0815'], { model: model, params: params })
    end
  end
end
