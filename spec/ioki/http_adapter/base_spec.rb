# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::HttpAdapter::Base do
  describe '::request' do
    let(:response_double) { instance_double(Faraday::Response, 'response double', status: 200, body: '', headers: []) }

    let(:method)  { :get  }
    let(:url)     { URI.parse('https://www.example.com') }
    let(:body)    { nil }
    let(:headers) { [] }
    let(:logger)  { nil }

    let(:result) do
      described_class.request(
        url:     url,
        method:  method,
        body:    body,
        headers: headers,
        logger:  logger
      )
    end

    it 'will internally dispatch to ::perform_request' do
      expect(described_class).to receive(:perform_request).
        with(method, url, body, headers).
        and_return(response_double)

      expect(result).to eq(response_double)
    end

    context 'when a logger is passed along' do
      let(:logger) { instance_double(Ioki::StdOutLogger, 'logger double') }

      it 'will internally dispatch to ::perform_request and write log output' do
        expect(described_class).to receive(:perform_request).
          with(method, url, body, headers).
          and_return(response_double)

        expect(logger).to receive(:debug).at_least(:once).and_return(true)

        expect(result).to eq(response_double)
      end
    end
  end
end
