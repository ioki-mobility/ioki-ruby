# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::HttpAdapter::Test do
  describe '::perform_request' do
    it 'returns an object responding to status with 200, an empty body and no headers' do
      result = described_class.perform_request(:get, 'foobar', nil, [])

      expect(result.status).to eq(200)
      expect(result.body).to be_empty
      expect(result.headers).to be_empty
    end
  end
end
