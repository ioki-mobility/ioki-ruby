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

RSpec.describe Faraday do
  let(:client) { Ioki::Client.new(Ioki::Configuration.new, DummyApi) }

  it 'does not retry on 404 errors' do
    ping_request = stub_request(:get, 'https://app.io.ki/api/driver/ping')
      .to_return_json(
        status: 404,
        body:   {}
      )

    expect do
      client.ping
    end.to raise_error Ioki::Error::NotFound

    expect(ping_request).to have_been_requested.once
  end

  it 'retries failed requests' do
    ping_request = stub_request(:get, 'https://app.io.ki/api/driver/ping')
      .to_return_json(
        { status: 500, body: { data: [] } },
        { status: 200, body: { data: [] } }
      )

    client.ping

    expect(ping_request).to have_been_requested.twice
  end

  it 'raises after max retries' do
    ping_request = stub_request(:get, 'https://app.io.ki/api/driver/ping')
      .to_return_json(status: 500, body: { data: [] })

    expect do
      client.ping
    end.to raise_error Ioki::Error::InternalServerError

    expect(ping_request).to have_been_requested.times(3)
  end

  context 'with network exceptions' do
    let!(:ping_request) do
      stub_request(:get, 'https://app.io.ki/api/driver/ping')
        .to_raise(Faraday::ConnectionFailed)
        .to_raise(EOFError)
        .to_return_json(
          status: 200,
          body:   { data: [] }
        )
    end

    it 'retries a connection failure' do
      client.ping

      expect(ping_request).to have_been_requested.times(3)
    end
  end

  context 'with auto_paginate' do
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
