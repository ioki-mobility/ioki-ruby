# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::Configuration do
  let(:config) { described_class.new }

  describe 'constants' do
    it 'defines DEFAULT_VALUES[:api_base_url]' do
      expect(described_class::DEFAULT_VALUES[:api_base_url]).to eq('https://app.io.ki/api/')
    end

    it 'defines DEFAULT_VALUES[:api_version]' do
      expect(described_class::DEFAULT_VALUES[:api_version]).to eq('20210101')
    end
  end

  it 'defines multiple configurable properties' do
    expect(described_class::CONFIG_KEYS).to contain_exactly(
      :http_adapter,
      :logger,
      :logger_options,
      :api_base_url,
      :api_version,
      :api_client_identifier,
      :api_client_secret,
      :api_client_version,
      :api_token,
      :api_bleeding_edge,
      :language,
      :oauth_app_id,
      :oauth_app_secret,
      :oauth_app_url,
      :oauth_access_token,
      :oauth_refresh_token,
      :oauth_token_callback,
      :retry_count,
      :retry_sleep_seconds,
      :ignore_deprecated_attributes,
      :proxy_url,
      :verify_ssl
    )
  end

  describe 'getter/setter pairs for configurable attributes' do
    described_class::CONFIG_KEYS.each do |attribute|
      it "defines a getter / setter for #{attribute}" do
        config.send(:"#{attribute}=", 42)
        expect(config.send(:"#{attribute}")).to eq(42)
      end
    end
  end

  describe 'default values and resetting' do
    before do
      allow(ENV).to receive(:fetch).and_return(nil)
      allow(ENV).to receive(:fetch).with('IOKI_VERIFY_SSL', anything).and_return('true')
      stub_const(
        'EXPECTED_DEFAULTS',
        {
          api_base_url:                 described_class::DEFAULT_VALUES[:api_base_url],
          api_version:                  described_class::DEFAULT_VALUES[:api_version],
          api_client_identifier:        nil,
          api_client_secret:            nil,
          api_client_version:           nil,
          api_token:                    nil,
          api_bleeding_edge:            false,
          language:                     'de',
          logger_options:               described_class::DEFAULT_VALUES[:logger_options],
          retry_count:                  3,
          retry_sleep_seconds:          1,
          ignore_deprecated_attributes: false,
          proxy_url:                    nil,
          verify_ssl:                   true
        }.freeze
      )
    end

    describe 'defines default values' do
      (described_class::CONFIG_KEYS - [:http_adapter]).each do |attribute|
        it "defines #{attribute} as the default value" do
          expect(config.send(attribute)).to eq(EXPECTED_DEFAULTS[attribute])
        end
      end
      it 'sets the http_adapter' do
        expect(config.http_adapter).to be_a Faraday::Connection
      end
    end

    describe '#reset!' do
      described_class::CONFIG_KEYS.each do |attribute|
        it "resets #{attribute} to values from ENV" do
          config.send(:"#{attribute}=", :dummy_value)

          expect { config.reset! }.to change {
            config.send(attribute)
          }.from(:dummy_value).to(EXPECTED_DEFAULTS[attribute]),
                                      "#{attribute} was expected to change to #{EXPECTED_DEFAULTS[attribute]}"
        end
      end
    end
  end

  describe 'loading config from environment variables' do
    it 'works without any arguments' do
      stub_const(
        'ENV',
        'IOKI_API_BASE_URL'          => 'BASE_URL',
        'IOKI_API_VERSION'           => 'API_VERSION',
        'IOKI_API_CLIENT_IDENTIFIER' => 'CLIENT_IDENTIFIER',
        'IOKI_API_CLIENT_SECRET'     => 'CLIENT_SECRET',
        'IOKI_API_CLIENT_VERSION'    => 'CLIENT_VERSION',
        'IOKI_API_TOKEN'             => 'API_TOKEN',
        'IOKI_API_BLEEDING_EDGE'     => 'true'
      )

      config_from_env = described_class.from_env

      expect(config_from_env.api_base_url).to eq 'BASE_URL'
      expect(config_from_env.api_version).to eq 'API_VERSION'
      expect(config_from_env.api_client_identifier).to eq 'CLIENT_IDENTIFIER'
      expect(config_from_env.api_client_secret).to eq 'CLIENT_SECRET'
      expect(config_from_env.api_client_version).to eq 'CLIENT_VERSION'
      expect(config_from_env.api_token).to eq 'API_TOKEN'
      expect(config_from_env.api_bleeding_edge).to be true
    end
  end

  describe '#token' do
    context 'with OAuth configuration' do
      before do
        config.oauth_app_id = 'dummy'
        config.oauth_app_secret = 'dummy'
        config.oauth_app_url = 'dummy'
        config.oauth_access_token = 'my-oauth-token'
        config.api_token = nil
      end

      it 'returns the OAuth access token' do
        expect(config.token).to eq 'my-oauth-token'
      end
    end

    context 'without OAuth configuration' do
      before do
        config.oauth_app_id = nil
        config.oauth_app_secret = nil
        config.oauth_app_url = nil
        config.oauth_access_token = 'my-oauth-token'
        config.api_token = 'my-token'
      end

      it 'returns the API token' do
        expect(config.token).to eq 'my-token'
      end
    end
  end
end
