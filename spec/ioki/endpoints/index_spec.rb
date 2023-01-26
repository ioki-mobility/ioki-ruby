# frozen_string_literal: true

RSpec.describe Ioki::Endpoints::Index do
  let(:client) do
    instance_double(
      Ioki::Client,
      'client',
      build_request_url: url
    )
  end
  let(:url)         { URI.parse('www.example.org') }
  let(:model_class) { Ioki::Model::Platform::Product }
  let(:response)    { Faraday::Response.new }
  let(:endpoint)    { described_class.new('product', base_path: ['base'], model_class: model_class) }
  let(:params)      { { per_page: 2 } }

  before 'stub client.request' do
    allow(client).to receive(:request) do |params|
      case params.dig(:params, :page)
      when nil, 1
        [
          {
            'data' => [{ 'id' => '001' }, { 'id' => '002' }],
            'meta' => { 'page' => 1, 'last_page' => false }
          },
          response
        ]
      when 2
        [
          {
            'data' => [{ 'id' => '003' }, { 'id' => '004' }],
            'meta' => { 'page' => 2, 'last_page' => false }
          },
          response
        ]
      when 3
        [
          {
            'data' => [{ 'id' => '005' }],
            'meta' => { 'page' => 3, 'last_page' => true }
          },
          response
        ]
      else
        raise 'unexpected call'
      end
    end
  end

  it 'calls #request on the client' do
    expect(client).to receive(:request).with(hash_including(url: url, params: params)).and_return('data' => [])
    endpoint.call client, [], model_class: model_class, params: params
  end

  it 'returns a two element Array' do
    result = endpoint.call client, [], model_class: model_class, params: params

    expect(result).to be_a(Array)
    expect(result.size).to eq(2)
  end

  it 'returns an Array of the correct model_class' do
    result = endpoint.call client, [], model_class: model_class, params: params

    expect(result.first).to be_a(model_class)
    expect(result.last).to be_a(model_class)
  end

  it 'returns an Array with the correct attributes' do
    result = endpoint.call client, [], model_class: model_class, params: params

    expect(result.first.id).to eq('001')
    expect(result.last.id).to eq('002')
  end

  it 'yields 2 times to the given block' do
    expect do |block|
      endpoint.call client, [], model_class: model_class, params: params, &block
    end.to yield_control.exactly(2).times
  end

  it 'yields each model to the given block with the correct model' do
    expect do |block|
      endpoint.call client, [], model_class: model_class, params: params, &block
    end.to yield_successive_args(
      have_attributes('id' => '001'),
      have_attributes('id' => '002')
    )
  end

  it 'provides a way to auto_paginate all elements' do
    result = endpoint.call client, [], model_class: model_class, params: params, auto_paginate: true

    expect(result).to be_a(Array)
    expect(result.size).to eq(5)
    expect(result.map(&:id)).to eq(%w[001 002 003 004 005])
  end

  it 'paginates and returns the first page' do
    result = endpoint.call client, [], model_class: model_class, params: params, paginate: true

    expect(result).to be_a(Ioki::Model::Response)

    expect(result.data).to be_a(Array)
    expect(result.data.size).to eq(2)
    expect(result.data.map(&:id)).to eq(%w[001 002])

    expect(result.meta).to be_a(Ioki::Model::Meta)
    expect(result.meta.page).to eq 1
    expect(result.meta.last_page).to be false
  end

  it 'paginates and returns another page' do
    result = endpoint.call client, [], model_class: model_class, params: params.merge(page: 3), paginate: true

    expect(result).to be_a(Ioki::Model::Response)

    expect(result.data).to be_a(Array)
    expect(result.data.size).to eq(1)
    expect(result.data.map(&:id)).to eq(%w[005])

    expect(result.meta).to be_a(Ioki::Model::Meta)
    expect(result.meta.page).to eq 3
    expect(result.meta.last_page).to be true
  end

  it 'yields 5 times to the given block using auto_paginate' do
    expect do |block|
      endpoint.call client, [], model_class: model_class, params: params, auto_paginate: true, &block
    end.to yield_control.exactly(5).times
  end

  it 'yields each model to the given block with the correct model using auto_paginate' do
    expect do |block|
      endpoint.call client, [], model_class: model_class, params: params, auto_paginate: true, &block
    end.to yield_successive_args(
      [have_attributes('id' => '001'), Faraday::Response],
      [have_attributes('id' => '002'), Faraday::Response],
      [have_attributes('id' => '003'), Faraday::Response],
      [have_attributes('id' => '004'), Faraday::Response],
      [have_attributes('id' => '005'), Faraday::Response]
    )
  end

  it 'works without an explicit params hash' do
    expect(client).to receive(:request).with(params: { page: 1 }, url: url).and_return('data' => [])
    endpoint.call(client, [], model_class: model_class, auto_paginate: true)
  end
end
