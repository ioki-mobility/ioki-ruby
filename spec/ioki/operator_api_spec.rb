# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::OperatorApi do
  let(:operator_client) do
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

  describe '#products' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products')
        result_with_index_data
      end

      expect(operator_client.products(options)).
        to eq([Ioki::Model::Operator::Product.new])
    end
  end

  describe '#product(id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815')
        [result_with_data, full_response]
      end

      expect(operator_client.product('0815', options)).
        to eq(Ioki::Model::Operator::Product.new)
    end
  end

  describe '#vehicles(product_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles')
        result_with_index_data
      end

      expect(operator_client.vehicles('0815', options)).
        to eq([Ioki::Model::Operator::Vehicle.new])
    end
  end

  describe '#vehicle(product_id, vehicle_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.vehicle('0815', '4711', options)).
        to eq(Ioki::Model::Operator::Vehicle.new)
    end
  end

  describe '#create_vehicle(product_id, vehicle)' do
    let(:vehicle) { Ioki::Model::Operator::Vehicle.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles')
        [result_with_data, full_response]
      end

      expect(operator_client.create_vehicle('0815', vehicle, options)).
        to eq(Ioki::Model::Operator::Vehicle.new)
    end
  end

  describe '#update_vehicle(product_id, vehicle)' do
    let(:vehicle) { Ioki::Model::Operator::Vehicle.new({ id: '4711' }) }

    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711')
        [result_with_data, full_response]
      end

      expect(operator_client.update_vehicle('0815', vehicle, options)).
        to eq(Ioki::Model::Operator::Vehicle.new)
    end
  end

  describe '#delete_vehicle(product_id, vehicle_id)' do
    it 'calls request on the client with expected params' do
      expect(operator_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('operator/products/0815/vehicles/4711')
        result_with_data
      end

      expect(operator_client.delete_vehicle('0815', '4711', options)).
        to eq(Ioki::Model::Operator::Vehicle.new)
    end
  end
end