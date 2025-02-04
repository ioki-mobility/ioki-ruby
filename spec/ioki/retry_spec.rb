# frozen_string_literal: true

require 'spec_helper'
require 'ioki/apis/endpoints/endpoints'

class DummyModel < Ioki::Model::Base
  attribute :value, on: :read, type: :integer
end

class DummyApi
  ENDPOINTS =
    [
      Ioki::Endpoints::Index.new(
        :ping,
        base_path:   ['driver'],
        model_class: DummyModel
      )
    ].freeze
end

RSpec.describe Ioki::Retry do
  it 'executes the given block' do
    called = false

    described_class.n_times(3) do
      called = true
    end

    expect(called).to be true
  end

  it 'retries when an exception is raised' do
    first_run = true
    called_count = 0

    described_class.n_times(3) do
      called_count += 1

      if first_run
        first_run = false
        raise Ioki::Error::Unauthorized, nil
      end
    end

    expect(called_count).to eq 2
  end

  it 'does not retry on 404 errors' do
    called_count = 0

    expect do
      described_class.n_times(3) do
        called_count += 1
        raise Ioki::Error::NotFound, Faraday::Response.new(
          Faraday::Env.new(
            'GET', '', '', nil, [], false, nil, nil, nil, nil, '404'
          )
        )
      end
    end.to raise_error Ioki::Error::NotFound

    expect(called_count).to eq 1
  end

  it 'retries only to the maximum' do
    called_count = 0

    expect do
      described_class.n_times(3) do
        called_count += 1

        raise Ioki::Error::Unauthorized, nil
      end
    end.to raise_error(Ioki::Retry::MaximumReached)

    expect(called_count).to eq 3
  end

  context 'with a Ioki client' do
    let(:client) { Ioki::Client.new(Ioki::Configuration.new, DummyApi) }

    it 'retries failed requests' do
      ping_request = stub_request(:get, 'https://app.io.ki/api/driver/ping')
        .to_return(
          { status: 500, body: '{"data": []}', headers: { content_type: 'application/json' } },
          { status: 200, body: '{"data": []}', headers: { content_type: 'application/json' } }
        )

      client.ping

      expect(ping_request).to have_been_requested.twice
    end

    it 'raises after max retries' do
      ping_request = stub_request(:get, 'https://app.io.ki/api/driver/ping')
        .to_return(status: 500, body: '{"data": []}', headers: { content_type: 'application/json' })

      expect do
        client.ping
      end.to raise_error Ioki::Retry::MaximumReached

      expect(ping_request).to have_been_requested.times(3)
    end

    context 'with network exceptions' do
      let!(:ping_request) do
        stub_request(:get, 'https://app.io.ki/api/driver/ping')
          .to_return(
            status:  200,
            body:    '{"data": []}',
            headers: { content_type: 'application/json' }
          )
      end

      before do
        return_values = [
          proc { raise Faraday::ConnectionFailed, StandardError.new },
          proc { raise EOFError }
        ]

        allow(client.config.http_adapter).to receive(:run_request).and_wrap_original do |original, *args|
          return_values.empty? ? original.call(*args) : return_values.shift.call
        end
      end

      it 'retries a connection failure' do
        client.ping

        # The webmock request is only invoked once. The other two exceptions
        # happen without invoking the mock.
        expect(ping_request).to have_been_requested.once
      end
    end
  end

  context 'with auto_paginate' do
    let(:client) { Ioki::Client.new(Ioki::Configuration.new, DummyApi) }

    it 'retries failed requests' do
      per_page = 2
      body = lambda do |page, total_pages|
        {
          data: (((page - 1) * per_page)...page * per_page).map { |value| { value: value } },
          meta: {
            total_count: per_page * total_pages,
            page:        page,
            last_page:   page == total_pages,
            total_pages: total_pages
          }
        }
      end

      ping_request_page_1 = stub_request(:get, 'https://app.io.ki/api/driver/ping?page=1')
        .to_return_json({ status: 200, body: body.call(1, 3) })
      ping_request_page_2 = stub_request(:get, 'https://app.io.ki/api/driver/ping?page=2')
        .to_return_json(
          { status: 500, body: {} },
          { status: 200, body: body.call(2, 3) }
        )
      ping_request_page_3 = stub_request(:get, 'https://app.io.ki/api/driver/ping?page=3')
        .to_return_json({ status: 200, body: body.call(3, 3) })

      received = []

      client.ping(auto_paginate: true) do |item|
        received << item.value
      end

      expect(received).to eq [0, 1, 2, 3, 4, 5]
      expect(ping_request_page_1).to have_been_requested.once
      expect(ping_request_page_2).to have_been_requested.twice
      expect(ping_request_page_3).to have_been_requested.once
    end
  end
end
