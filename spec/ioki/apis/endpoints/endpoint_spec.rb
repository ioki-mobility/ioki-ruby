# frozen_string_literal: true

module Ioki
  module Model
    class Bread < Base
      attribute :grain_type, on: :read
    end
  end
end

RSpec.describe Endpoints::Endpoint do
  describe '.initialize' do
    it 'succeeds with required arguments' do
      described_class.new('bread', action: 'get', request_method: :get, path: ['bakery'])
    end
  end

  describe '#call' do
    let(:params) { instance_double(Hash, :params) }
    let(:url) { instance_double(URI, :url) }
    let(:request) { instance_double(Faraday::Request, :request, :[] => { grain_type: 'wheat' }) }
    let(:client) do
      instance_double(Ioki::Client, :client, build_request_url: url, request: request)
    end
    let(:endpoint) { described_class.new('bread', action: 'get', request_method: :get, path: ['bakery']) }

    it 'passes on given params to client#request' do
      expect(client).to receive(:request).with(method: :get, body: nil, params: params, url: url)

      endpoint.call(client, [], params: params)
    end

    context 'with a given model_class' do
      let(:endpoint) do
        described_class.new(
          'bread', action: 'get', request_method: :get, path: ['bakery'], model_class: Ioki::Model::Bread
        )
      end

      it 'wraps the response in a model' do
        expect(endpoint.call(client, [model_class: Ioki::Model::Bread])).
          to eq Ioki::Model::Bread.new(grain_type: 'wheat')
      end
    end
  end
end
