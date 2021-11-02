# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::HttpAdapter::Faraday do
  describe '::perform_request' do
    it 'initializes a Faraday connection and dispatches the params to #run_request' do
      connection_double = instance_double(Faraday::Connection, 'connection double')
      response_double = instance_double(Faraday::Response, 'response double')

      expect(::Faraday).to receive(:new).and_return(connection_double)

      expect(connection_double).to receive(:run_request).
        with(:get, 'foobar', nil, []).and_return(response_double)

      result = described_class.perform_request(:get, 'foobar', nil, [])

      expect(result).to eq(response_double)
    end
  end
end
