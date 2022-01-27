# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Ioki::OperatorApi', :vcr do
  # Compare fixtures/vcr_cassettes for the recorded requests and responses for this example.

  setup_operator_client(:operator_client)
  let(:real_demo_product_id) { operator_client.products.first.id }

  describe 'vehicle endpoint' do
    it 'return their corresponding models' do
      expect(operator_client.vehicles(real_demo_product_id).first).to be_a(Ioki::Model::Operator::Vehicle)
    end
  end
end
