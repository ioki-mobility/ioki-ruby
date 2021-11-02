# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::Configuration do
  let(:config) { described_class.new }

  describe 'constants' do
    it 'defines DEFAULT_API_BASE_URL' do
      expect(described_class::DEFAULT_API_BASE_URL).to eq('https://app.io.ki/api/')
    end

    it 'defines DEFAULT_API_VERSION' do
      expect(described_class::DEFAULT_API_VERSION).to eq('20210101')
    end
  end

  it 'defines multiple configurable properties' do
    expect(described_class::CONFIG_KEYS).to match_array(
      [
        :http_adapter,
        :verbose_output,
        :logger,
        :api_base_url,
        :api_version,
        :api_client_identifier,
        :api_client_secret,
        :api_client_version,
        :api_token,
        :language
      ]
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
    logger_double = :logger

    before do
      allow(ENV).to receive(:[]).and_return(nil)
      allow(Ioki::StdOutLogger).to receive(:new).and_return(logger_double)
      stub_const(
        'EXPECTED_DEFAULTS',
        {
          http_adapter:          :faraday,
          verbose_output:        false,
          logger:                logger_double,
          api_base_url:          described_class::DEFAULT_API_BASE_URL,
          api_version:           described_class::DEFAULT_API_VERSION,
          api_client_identifier: nil,
          api_client_secret:     nil,
          api_client_version:    nil,
          api_token:             nil,
          language:              'de'
        }.freeze
      )
    end

    describe 'defines default values' do
      described_class::CONFIG_KEYS.each do |attribute|
        it "defines #{attribute} as the default value" do
          expect(config.send(attribute)).to eq(EXPECTED_DEFAULTS[attribute])
        end
      end
    end

    describe '#reset!' do
      described_class::CONFIG_KEYS.each do |attribute|
        it "resets #{attribute} to the default value" do
          config.send(:"#{attribute}=", :dummy_value)

          expect { config.reset! }.to change {
            config.send(attribute)
          }.from(:dummy_value).to(EXPECTED_DEFAULTS[attribute])
        end
      end
    end
  end
end
