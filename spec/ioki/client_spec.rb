# frozen_string_literal: true

require 'spec_helper'

class NullApi
  ENDPOINTS = [].freeze
end

RSpec.describe Ioki::Client do
  let(:custom_config) { Ioki::Configuration.new }
  let(:client) { described_class.new(custom_config, NullApi) }

  describe 'constants' do
    it { expect(described_class::VALID_API_NAMESPACES).to eq([:platform, :passenger, :driver]) }
  end

  describe 'initializiation and configuration:' do
    it 'carries its own config' do
      expect(client.config).to be_kind_of(Ioki::Configuration)
    end

    describe 'config defaults' do
      Ioki::Configuration::CONFIG_KEYS.each do |attribute|
        it "is for #{attribute} the same as on a new Ioki::Configuration" do
          expect(client.config).to be_kind_of(Ioki::Configuration)
        end
      end
    end

    describe 'overriding particular attributes on a client during initialize' do
      Ioki::Configuration::CONFIG_KEYS.each do |attribute|
        it "works for #{attribute}" do
          custom_config.send("#{attribute}=", 42)
          expect(described_class.new(custom_config, NullApi).config.send(attribute)).to eq(42)
        end
      end
    end

    describe 'the adapter class' do
      context 'when http_adapter = :faraday' do
        before { custom_config.http_adapter = :faraday }

        it 'is Ioki::HttpAdapter::Faraday' do
          expect(described_class.new(custom_config, NullApi).http_adapter_class).to eq(Ioki::HttpAdapter::Faraday)
        end
      end

      context 'when http_adapter = :test' do
        before { custom_config.http_adapter = :test }

        it 'is Ioki::HttpAdapter::Test' do
          expect(described_class.new(custom_config, NullApi).http_adapter_class).to eq(Ioki::HttpAdapter::Test)
        end
      end
    end
  end

  describe 'request' do
    subject(:client_response) do
      client.request(
        url:     passed_url,
        method:  passed_method,
        body:    passed_body,
        headers: passed_headers,
        params:  passed_params,
        logger:  passed_logger
      )
    end

    let(:passed_url)     { URI.parse('https://www.example.com') }
    let(:passed_method)  { instance_double(String, 'method_double') }
    let(:passed_body)    { instance_double(Hash, 'body_double') }
    let(:passed_headers) { instance_double(Hash, 'headers_double') }
    let(:passed_params)  { nil }
    let(:passed_logger)  { instance_double(Ioki::StdOutLogger, 'logger_double') }

    let(:http_adapter_class_response) do
      instance_double(Faraday::Response, status: 200, body: '{}')
    end

    before do
      allow(client.http_adapter_class).to receive(:request).
        and_return(http_adapter_class_response)
    end

    it 'delegates the request to the current adapter' do
      client.config.verbose_output = false

      expect(
        client.http_adapter_class
      ).to receive(
        :request
      ).with(
        url:     passed_url,
        method:  passed_method,
        body:    passed_body,
        headers: passed_headers,
        logger:  passed_logger
      ).and_return(http_adapter_class_response)

      client_response
    end

    context 'when config.verbose_output is true' do
      before { client.config.verbose_output = true }

      context 'when no logger is passed' do
        let(:passed_logger) { nil }

        it 'passes config.logger to the current adapter' do
          expect(client.http_adapter_class).to receive(:request).with(
            hash_including(logger: client.config.logger)
          ).and_return(http_adapter_class_response)

          client_response
        end
      end

      context 'when a dedicated logger is passed' do
        let(:passed_logger) { instance_double(Ioki::StdOutLogger, 'dedicated logger') }

        it 'passes this one to the current adapter' do
          expect(client.http_adapter_class).to receive(:request).with(
            hash_including(logger: passed_logger)
          ).and_return(http_adapter_class_response)

          client_response
        end
      end
    end

    context 'when additional params are sent along via options' do
      let(:passed_url) { URI.parse('https://www.example.com/api/endpoint?existing=param') }
      let(:passed_params) { { bar: 43, baz: 'hello world' } }

      it 'will encode these onto the url as query params and then call the http adapter with this url' do
        client.config.verbose_output = true

        # the expected query URL should contain every query parameter that was already
        # existing on the url plus the ones that get merged from options[params]
        expected_url = passed_url.dup
        expected_url.query = URI.encode_www_form(
          existing: 'param',
          bar:      43,
          baz:      'hello world'
        )

        expect(client.http_adapter_class).to receive(:request).with(
          hash_including(url: expected_url)
        ).and_return(http_adapter_class_response)

        client_response
      end
    end

    context 'when the underlying http adapter response indicates an error' do
      let(:http_adapter_class_response) do
        instance_double(Faraday::Response, 'response double', status: 500, body: '')
      end

      it 'will map this to the proper error and raise it' do
        expect(client.http_adapter_class).to receive(:request).and_return(http_adapter_class_response)
        expect { client_response }.to raise_error(Ioki::Error::InternalServerError)
      end
    end

    context 'when the underlying http adapter response indicates an API error' do
      let(:http_adapter_class_response) do
        instance_double(
          Faraday::Response,
          'response double',
          status: 422,
          body:   {
            api_errors:        [{ message: 'Uh Oh!', code: 'error' }],
            debug_information: [{ model: 'User', errors: { first_name: [{ error: 'silly' }] } }]
          }.to_json
        )
      end

      it 'will map this to a proper error and raise it' do
        expect(client.http_adapter_class).to receive(:request).and_return(http_adapter_class_response)
        expect { client_response }.to raise_error(Ioki::Error::UnprocessableEntity)
      end

      it 'will expose through this error the api_error as a hash with information' do
        expect(client.http_adapter_class).to receive(:request).and_return(http_adapter_class_response)

        begin
          client_response
        rescue StandardError => e
          expect(e).to be_kind_of(Ioki::Error::UnprocessableEntity)
          expect(e.http_response).to eq(http_adapter_class_response)
          expect(e.api_error).to eq(
            {
              'api_errors'        => [
                { 'message' => 'Uh Oh!', 'code' => 'error' }
              ],
              'debug_information' => [
                {
                  'model'  => 'User',
                  'errors' => {
                    'first_name' => [{ 'error' => 'silly' }]
                  }
                }
              ]
            }
          )
        end
      end
    end

    context 'when the underlying http adapter response is without error' do
      let(:http_adapter_class_response) do
        instance_double(Faraday::Response, 'response double', status: 201, body: '{"foo": 42}')
      end

      it 'will return primarily the parsed response and as a second argument the actual response' do
        expect(client.http_adapter_class).to receive(:request).and_return(http_adapter_class_response)
        expect(client_response).to eq([{ 'foo' => 42 }, http_adapter_class_response])
      end

      context 'when response body is nil' do
        let(:http_adapter_class_response) do
          instance_double(Faraday::Response, 'response double', status: 200, body: nil)
        end

        it 'will return nil' do
          expect(client.http_adapter_class).to receive(:request).and_return(http_adapter_class_response)
          expect(client_response).to eq([nil, http_adapter_class_response])
        end
      end

      context 'when response body is empty' do
        let(:http_adapter_class_response) do
          instance_double(Faraday::Response, 'response double', status: 200, body: '')
        end

        it 'will return nil' do
          expect(client.http_adapter_class).to receive(:request).and_return(http_adapter_class_response)
          expect(client_response).to eq([nil, http_adapter_class_response])
        end
      end

      context 'when response body is somewhat malformed' do
        let(:http_adapter_class_response) do
          instance_double(Faraday::Response, 'response double', status: 200, body: '{ look"mum" & $ : borken_json ')
        end

        it 'raise a proper error' do
          expect(client.http_adapter_class).to receive(:request).and_return(http_adapter_class_response)
          expect { client_response }.to raise_error(Ioki::Error::ResponseMalformed)
        end
      end
    end

    describe 'etag' do
      let(:http_adapter_class_response) do
        instance_double(
          Faraday::Response,
          'response double',
          status:  200,
          body:    '{"foo": 42}',
          headers: { etag: 'ETAG' }
        )
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

        expect(client.build_request_url('passenger', :foo, 42, :bar).to_s).to eq(
          'http://www.example.com/api/passenger/foo/42/bar'
        )

        expect(client.build_request_url('platform', :foo, 42, :bar).to_s).to eq(
          'http://www.example.com/api/platform/foo/42/bar'
        )

        expect(client.build_request_url('driver', :foo, 42, :bar).to_s).to eq(
          'http://www.example.com/api/driver/foo/42/bar'
        )
      end
    end

    context 'when called with parameters having additional slashes (/)' do
      it 'is able to properly build URLs' do
        client.config.api_base_url = 'http://www.example.com/api/'

        expect(client.build_request_url(:passenger, '/foo/', 42, '/bar/').to_s).to eq(
          'http://www.example.com/api/passenger/foo/42/bar'
        )

        expect(client.build_request_url(:platform, '/foo/', 42, '/bar/').to_s).to eq(
          'http://www.example.com/api/platform/foo/42/bar'
        )

        expect(client.build_request_url(:driver, '/foo/', 42, '/bar/').to_s).to eq(
          'http://www.example.com/api/driver/foo/42/bar'
        )
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

  describe '#default_headers' do
    it 'returns proper headers' do
      expect(client.default_headers).to eq(
        {
          'Content-Type'    => 'application/json',
          'Accept'          => 'application/json',
          'Accept-Language' => 'de'
        }
      )
    end

    it 'ensures that language information is casted to a string' do
      client.config.language = :'en-BZ'
      expect(client.default_headers['Accept-Language']).to eq('en-BZ')
    end
  end

  describe '#api_headers' do
    it 'returns proper headers' do
      expect(client.api_headers).to eq(
        {
          'X-Api-Version' => client.config.api_version
        }
      )
    end
  end

  describe '#client_headers' do
    it 'returns proper headers' do
      expect(client.client_headers).to eq(
        {
          'X-Client-Identifier' => client.config.api_client_identifier,
          'X-Client-Secret'     => client.config.api_client_secret,
          'X-Client-Version'    => client.config.api_client_version
        }
      )
    end
  end

  describe '#auth_headers' do
    it 'returns proper headers' do
      expect(client.auth_headers).to eq(
        {
          'Authorization' => "Bearer #{client.config.api_token}"
        }
      )
    end
  end

  describe '#all_headers' do
    it 'returns proper headers' do
      expect(client.all_headers).to eq(
        {
          'Content-Type'        => 'application/json',
          'Accept'              => 'application/json',
          'Accept-Language'     => 'de',
          'X-Api-Version'       => client.config.api_version,
          'X-Client-Identifier' => client.config.api_client_identifier,
          'X-Client-Secret'     => client.config.api_client_secret,
          'X-Client-Version'    => client.config.api_client_version,
          'Authorization'       => "Bearer #{client.config.api_token}"
        }
      )
    end

    context 'when skip_auth: true is passed' do
      it 'omits the Authorization header' do
        expect(client.all_headers(skip_auth: true).keys).not_to include('Authorization')
      end
    end

    context 'when etag is passed' do
      it 'sets an If-None-Match header' do
        expect(client.all_headers(etag: 'ETAG')).to include('If-None-Match' => 'ETAG')
      end
    end
  end
end
