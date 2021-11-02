# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::DriverApi do
  let(:driver_client) do
    Ioki::Client.new(
      instance_double(
        Ioki::Configuration,
        :config,
        api_base_url:          'https://app.io.ki/api',
        api_version:           '1',
        api_client_identifier: 'ID',
        api_client_secret:     'SECRET',
        api_client_version:    'VERSION',
        api_token:             'TOKEN',
        language:              'de'
      ),
      described_class
    )
  end
  let(:result_with_data) { instance_double(Hash, 'result double with data', '[]' => {}) }
  let(:result_with_index_data) { instance_double(Hash, 'result double with data', '[]' => [{}]) }
  let(:full_response) { instance_double(Faraday::Response, 'full_response', headers: {}) }
  let(:options) { { options: :example } }

  describe '#create_request_token' do
    let(:request_token) { Ioki::Model::Driver::DriverRequestToken.new }

    it 'calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/driver/request_tokens')
        result_with_data
      end

      expect(driver_client.create_request_token(request_token, options)).
        to eq(Ioki::Model::Driver::DriverRequestToken.new)
    end
  end

  describe '#product' do
    it 'calls request on the client with expected params' do
      expect(driver_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/driver/product')
        [result_with_data, full_response]
      end

      expect(driver_client.product(options)).
        to eq(Ioki::Model::Driver::Product.new)
    end
  end
end
