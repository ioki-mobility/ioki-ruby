# frozen_string_literal: true

require 'spec_helper'
require 'logger'
require 'securerandom'

RSpec.describe Ioki::HttpAdapter do
  subject(:http_adapter) { described_class.get(config) }

  let(:config) do
    Ioki::Configuration.new(
      api_base_url:          'https://app.io.ki/api',
      api_version:           'api_version',
      api_client_identifier: 'api_client_identifier',
      api_client_secret:     SecureRandom.alphanumeric,
      api_client_version:    'api_client_version',
      api_token:             SecureRandom.alphanumeric,
      language:              :'en-BZ',
      logger:                logger,
      logger_options:        { headers: true, bodies: true }
    )
  end
  let(:logger) { nil }
  let(:request) do
    http_adapter.get('platform/providers')
  end

  before do
    # Stub the platform/providers request on a layer below Faraday::Connection
    # using webmocks on Net::HTTP class
    stub_request(:get, 'https://app.io.ki/api/platform/providers').to_return(status: 200, body: '{}', headers: {})
  end

  it { is_expected.to be_a Faraday::Connection }

  it 'sets the api_base_url' do
    expect(http_adapter.url_prefix.to_s).to eq config.api_base_url
  end

  it 'uses the api_base_url to create the full URL' do
    expect(request.env.url.to_s).to eq 'https://app.io.ki/api/platform/providers'
  end

  it 'logs the request if logger is present' do
    config.logger = ::Logger.new(STDOUT)
    expect(config.logger).to receive(:info).at_least(:once)
    http_adapter.get('platform/providers')
  end

  describe 'headers' do
    subject(:request_headers) do
      request.env.request_headers
    end

    it { is_expected.to include 'Content-Type'        => 'application/json' }
    it { is_expected.to include 'Accept'              => 'application/json' }
    it { is_expected.to include 'Accept-Language'     => 'en-BZ' }
    it { is_expected.to include 'X-Api-Version'       => config.api_version }
    it { is_expected.to include 'X-Client-Identifier' => config.api_client_identifier }
    it { is_expected.to include 'X-Client-Secret'     => config.api_client_secret }
    it { is_expected.to include 'X-Client-Version'    => config.api_client_version }
    it { is_expected.to include 'Authorization'       => "Bearer #{config.api_token}" }

    context 'when there is a header without a value' do
      before do
        config.api_client_identifier = nil
      end

      it { is_expected.not_to include 'X-Client-Identifier' }
    end
  end

  describe 'logger' do
    let(:logger) { instance_double(::Logger, 'logger') }

    it 'uses the correct encoding from the Content-Type header' do
      stub_request(:get, 'https://app.io.ki/api/platform/products').to_return(
        status:  200,
        body:    [{ name: 'Grüne Höhe Wägen' }].to_json.force_encoding(Encoding::ASCII_8BIT),
        headers: { 'Content-Type' => 'application/json; charset=utf-8' }
      )
      allow(logger).to receive(:info) do |*_args, &block|
        body = block.call
        expect(body.encoding).to eq(Encoding::UTF_8)
      end
      http_adapter.get('platform/products')
    end

    it 'scrubs the api_client_secret and the api_token from the logs' do
      stub_request(:get, 'https://app.io.ki/api/platform/products').to_return(status: 200, body: '[]', headers: {})
      allow(logger).to receive(:info) do |*_args, &block|
        body = block.call
        expect(body).not_to include(config.api_client_secret)
        expect(body).not_to include(config.api_token)
      end
      http_adapter.get('platform/products')
    end
  end
end
