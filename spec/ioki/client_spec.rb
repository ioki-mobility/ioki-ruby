# frozen_string_literal: true

require 'spec_helper'

class NullApi
  ENDPOINTS = [].freeze
end

RSpec.describe Ioki::Client do
  let(:config) { Ioki::Configuration.new http_adapter: http_adapter }
  let(:client) { described_class.new(config, NullApi) }
  let(:http_adapter) do
    Faraday.new do |f|
      f.adapter :test, stubs
      f.request :json # encode req bodies as JSON
      f.response :json # decode response bodies as JSON
    end
  end
  let(:stubs) { Faraday::Adapter::Test::Stubs.new }

  describe 'constants' do
    it { expect(described_class::VALID_API_NAMESPACES).to eq([:driver, :operator, :passenger, :platform]) }
  end

  describe 'initializiation and configuration:' do
    it 'carries its own config' do
      expect(client.config).to be_kind_of(Ioki::Configuration)
    end

    describe 'config defaults' do
      Ioki::Configuration::DEFAULT_VALUES.each do |attribute, value|
        it "is for #{attribute} the same as on a new Ioki::Configuration" do
          expect(client.config.send(attribute)).to eq value
        end
      end
    end

    describe 'overriding particular attributes on a client during initialize' do
      Ioki::Configuration::CONFIG_KEYS.each do |attribute|
        it "works for #{attribute}" do
          config.send("#{attribute}=", 42)
          expect(described_class.new(config, NullApi).config.send(attribute)).to eq(42)
        end
      end
    end

    it 'has a Faraday http_adapter' do
      expect(client.config.http_adapter).to be_kind_of(Faraday::Connection)
    end

    it 'uses the given Faraday http_adapter' do
      expect(client.config.http_adapter).to eq http_adapter
    end
  end

  describe 'request' do
    subject(:client_response) do
      client.request(
        url:     passed_path,
        method:  passed_method,
        body:    passed_body,
        headers: passed_headers,
        params:  passed_params
      )
    end

    let(:passed_path)    { URI.parse('some/path') }
    let(:passed_method)  { :get }
    let(:passed_body)    { { body: :attr } }
    let(:passed_headers) { { header: 'x' } }
    let(:passed_params)  { nil }

    let(:response) { [200, {}, { x: 'y' }] }

    before do
      stubs.get(passed_path.to_s) { |_env| response }
    end

    it 'delegates the request to the current adapter' do
      expect(
        client.config.http_adapter
      ).to receive(
        :run_request
      ).with(
        passed_method,
        passed_path,
        passed_body,
        passed_headers
      ).and_call_original

      client_response
    end

    context 'when additional params are sent along via options' do
      let(:passed_path) { URI.parse('endpoint?existing=param') }
      let(:passed_params) { { bar: 43, baz: 'hello world' } }

      it 'will encode these onto the url as query params and then call the http adapter with this url' do
        # the expected query URL should contain every query parameter that was already
        # existing on the url plus the ones that get merged from options[params]
        expected_url = passed_path.dup
        expected_url.query = URI.encode_www_form(
          existing: 'param',
          bar:      43,
          baz:      'hello world'
        )

        expect(client.config.http_adapter).to receive(:run_request).with(
          passed_method,
          expected_url,
          passed_body,
          passed_headers
        ).and_call_original

        client_response
      end
    end

    context 'when the underlying http adapter response indicates an error' do
      let(:response) { [500, {}, ''] }

      it 'will map this to the proper error and raise it' do
        expect { client_response }.to raise_error(Ioki::Error::InternalServerError)
      end
    end

    context 'when the underlying http adapter response indicates an API error' do
      let(:response) do
        [
          422,
          {},
          sent_response_body
        ]
      end
      let(:sent_response_body) do
        {
          api_errors:        [{ message: 'Uh Oh!', code: 'error' }],
          debug_information: [{ model: 'User', errors: { first_name: [{ error: 'silly' }] } }]
        }
      end

      it 'will map this to a proper error and raise it' do
        expect { client_response }.to raise_error(Ioki::Error::UnprocessableEntity)
      end

      it 'will expose through this error the api_error as a hash with information' do
        client_response
      rescue StandardError => e
        expect(e).to be_kind_of(Ioki::Error::UnprocessableEntity)
        expect(e.http_response.env.response_body).to eq(sent_response_body)
        expect(e.api_error).to eq(sent_response_body)
      end

      it 'will expose the HTTP status in the error message' do
        client_response
      rescue StandardError => e
        expect(e.message).to include '422'
      end

      it 'will expose the requested URL in the error message' do
        client_response
      rescue StandardError => e
        expect(e.message).to include passed_path.to_s
      end

      it 'will expose the HTTP response body in the error message' do
        client_response
      rescue StandardError => e
        expect(e.message).to include sent_response_body.to_s
      end
    end

    context 'when the underlying http adapter response is without error' do
      let(:response) do
        [201, {}, { 'foo' => 42 }]
      end

      it 'will return primarily the parsed response and as a second argument the actual response' do
        expect(client_response[0]).to eq({ 'foo' => 42 })
        expect(client_response[1]).to be_a Faraday::Response
      end

      context 'when response body is nil' do
        let(:response) do
          [200, {}, nil]
        end

        it 'will return nil' do
          expect(client_response[0]).to eq(nil)
        end
      end

      context 'when response body is empty' do
        let(:response) do
          [200, {}, '']
        end

        it 'will return nil' do
          expect(client_response[0]).to eq(nil)
        end
      end

      context 'when response body is somewhat malformed' do
        let(:response) do
          [200, {}, '{ look"mum" & $ : borken_json ']
        end

        it 'raise a proper error' do
          expect { client_response }.to raise_error(Faraday::ParsingError)
        end
      end
    end

    describe 'etag' do
      let(:response) do
        [200, { etag: 'ETAG' }, { 'foo' => 42 }]
      end

      it 'is accessible next to the parsed data' do
        parsed_data, response = client_response
        expect(parsed_data).to eq({ 'foo' => 42 })
        expect(response.headers[:etag]).to eq('ETAG')
      end
    end
  end

  describe 'build_request_url' do
    context 'when called with proper parameters' do
      it 'is able to properly build URLs' do
        client.config.api_base_url = 'http://www.example.com/api'
        expect(client.build_request_url('passenger', :foo, 42, :bar).to_s).to eq('passenger/foo/42/bar')
        expect(client.build_request_url('platform', :foo, 42, :bar).to_s).to eq('platform/foo/42/bar')
        expect(client.build_request_url('driver', :foo, 42, :bar).to_s).to eq('driver/foo/42/bar')
      end
    end

    context 'when called with parameters having additional slashes (/)' do
      it 'is able to properly build URLs' do
        client.config.api_base_url = 'http://www.example.com/api/'
        expect(client.build_request_url(:passenger, '/foo/', 42, '/bar/').to_s).to eq('passenger/foo/42/bar')
        expect(client.build_request_url(:platform, '/foo/', 42, '/bar/').to_s).to eq('platform/foo/42/bar')
        expect(client.build_request_url(:driver, '/foo/', 42, '/bar/').to_s).to eq('driver/foo/42/bar')
      end
    end

    context 'when called with unknown api_namespaces' do
      it 'will raise an argument error' do
        expect { client.build_request_url(:foobar, '/foo/', 42, '/bar/') }.to raise_error(
          ArgumentError, "Unknown api namespace 'foobar'"
        )
      end
    end
  end
end
