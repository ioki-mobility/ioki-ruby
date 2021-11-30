# frozen_string_literal: true

RSpec.describe Endpoints::Index do
  let(:client) do
    instance_double(
      Ioki::Client,
      'client',
      build_request_url: url
    )
  end
  let(:url)         { URI.parse('www.example.org') }
  let(:model_class) { Ioki::Model::Platform::Product }
  let(:parsed_response) { instance_double(Hash, 'parsed_response', :[] => [], dig: {}) }
  let(:full_response) { instance_double(Faraday::Response, 'full_response') }
  let(:endpoint)  { described_class.new('product', base_path: ['base'], model_class: model_class) }
  let(:params)    { instance_double(Hash, 'params') }

  it 'calls #request on the client instantiating classes from the result' do
    expect(client).to receive(:request).
      with(hash_including(
             url:    url,
             params: params
           )).and_return(
             { 'data' => [{ 'id' => '0815' }, { 'id' => '4711' }] }
           )

    result = endpoint.call(client, [], model_class: model_class, params: params)

    expect(result).to be_kind_of(Array)
    expect(result.size).to eq(2)

    expect(result.first).to be_kind_of(model_class)
    expect(result.first.id).to eq('0815')

    expect(result.last).to be_kind_of(model_class)
    expect(result.last.id).to eq('4711')
  end

  it 'provides a way to auto_paginate all elements' do
    call_number = 0

    allow(client).to receive(:request) do |params|
      call_number += 1

      case call_number
      when 1
        expect(params[:params].to_s).to eq('{:per_page=>2, :page=>1}')
        { 'data' => [{ 'id' => '001' }, { 'id' => '002' }], 'meta' => { 'page' => 1, 'last_page' => false } }
      when 2
        expect(params[:params].to_s).to eq('{:per_page=>2, :page=>2}')
        { 'data' => [{ 'id' => '003' }, { 'id' => '004' }], 'meta' => { 'page' => 2, 'last_page' => false } }
      when 3
        expect(params[:params].to_s).to eq('{:per_page=>2, :page=>3}')
        { 'data' => [{ 'id' => '005' }], 'meta' => { 'page' => 3, 'last_page' => true } }
      else
        raise 'unexpected call'
      end
    end

    result = endpoint.call(
      client,
      [],
      model_class:   model_class,
      params:        { per_page: 2 },
      auto_paginate: true
    )

    expect(result).to be_kind_of(Array)
    expect(result.size).to eq(5)
    expect(result.map(&:id)).to eq(%w[001 002 003 004 005])
  end

  # https://github.com/kaminari/kaminari/issues/962
  # https://github.com/kaminari/kaminari/issues/582
  it 'When there are no results, the API returns last_page: false for the page 1' \
     'auto_paginate should not continue to request data when there are no results' do
    allow(client).to receive(:request) do |params|
      expect(params[:params][:page]).not_to eq(2)
      { 'data' => [], 'meta' => { 'page' => 1, 'last_page' => false } }
    end
    endpoint.call(
      client,
      [],
      model_class:   model_class,
      auto_paginate: true
    )
  end

  it 'works without an explicit params hash' do
    expect(client).
      to receive(:request).
      with(params: { page: 1 }, url: url).
      and_return('data' => [{ 'id' => '4711' }])

    endpoint.call(client, [], model_class: model_class, auto_paginate: true)
  end
end
