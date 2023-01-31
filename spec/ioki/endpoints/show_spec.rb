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

    expect(result).to be_a(model_class)
    expect(result.id).to eq('0815')
  end

  it "sets the response's etag to the model" do
    allow(client).to receive(:request).and_return([parsed_data, response])

    expect(endpoint.call(client, ['0815'])._etag).to eq 'ETAG'
  end

  context 'with a model that has an etag' do
    let(:model) { Ioki::Model::Platform::Product.new }

    before { model._etag = 'ETAG' }

    it "passes on the model's etag to the request method via headers" do
      expect(client).to receive(:request).with(
        url:     url,
        headers: { 'If-None-Match': model._etag },
        params:  params
      ).and_return([parsed_data, response])

      endpoint.call(client, ['0815'], { model: model, params: params })
    end
  end

  context 'with an array based response' do
    let(:parsed_data) do
      { 'data' => [{ id: 'ride', name: 'ride', channels: ['sms'], type: 'notification_setting' }] }
    end
    let(:response) do
      instance_double(
        Faraday::Response,
        'response double',
        status:  200,
        body:    parsed_data,
        headers: { etag: 'ETAG' }
      )
    end
    let(:endpoint) do
      described_class.new(
        'notification_settings',
        base_path:   ['base'],
        model_class: Ioki::Model::Passenger::NotificationSettings
      )
    end

    it 'parses data and etag' do
      expect(client).to receive(:request).and_return([parsed_data, response])

      notification_settings = endpoint.call(client, ['0815'])

      expect(notification_settings).to be_a Ioki::Model::Passenger::NotificationSettings
      expect(notification_settings._etag).to eq 'ETAG'
      expect(notification_settings._raw_attributes).to eq parsed_data['data']
      expect(notification_settings.data).to eq [
        Ioki::Model::Passenger::NotificationSetting.new(
          id:       'ride',
          name:     'ride',
          channels: ['sms'],
          type:     'notification_setting'
        )
      ]
    end
  end

  context 'with a string response' do
    let(:model_class) do
      Class.new(Ioki::Model::Base) do
        base 'String'
      end
    end
    let(:parsed_data) do
      { 'data' => 'test string' }
    end
    let(:response) do
      instance_double(
        Faraday::Response,
        'response double',
        status:  200,
        body:    parsed_data,
        headers: { etag: 'ETAG' }
      )
    end
    let(:endpoint) do
      described_class.new(
        'example_class',
        base_path:   ['base'],
        model_class: model_class
      )
    end

    it 'parses data and etag' do
      expect(client).to receive(:request).and_return([parsed_data, response])

      response = endpoint.call(client, ['0815'])

      expect(response).to be_a model_class
      expect(response._etag).to eq 'ETAG'
      expect(response._raw_attributes).to eq parsed_data['data']
      expect(response.data).to eq 'test string'
    end
  end
end
