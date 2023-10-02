# frozen_string_literal: true

require 'spec_helper'
require 'ioki/apis/endpoints/endpoints'

class DummyApi
  ENDPOINTS =
    [
      Ioki::Endpoints::Index.new(
        :ping,
        base_path:   ['driver'],
        model_class: Ioki::Model::Base
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
  end
end
