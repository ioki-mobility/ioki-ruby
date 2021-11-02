# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::Error do
  describe '#http_status_code_to_error_class(code)' do
    it 'resolves 200 to nil' do
      expect(described_class.http_status_code_to_error_class(200)).to be_nil
    end

    it 'resolves 300 to Ioki::Error::UnexpectedRedirection' do
      expect(described_class.http_status_code_to_error_class(300)).to eq(Ioki::Error::UnexpectedRedirection)
    end

    it 'resolves 401 to Ioki::Error::Unauthorized' do
      expect(described_class.http_status_code_to_error_class(401)).to eq(Ioki::Error::Unauthorized)
    end

    it 'resolves 403 to Ioki::Error::Forbidden' do
      expect(described_class.http_status_code_to_error_class(403)).to eq(Ioki::Error::Forbidden)
    end

    it 'resolves 404 to Ioki::Error::NotFound' do
      expect(described_class.http_status_code_to_error_class(404)).to eq(Ioki::Error::NotFound)
    end

    it 'resolves 406 to Ioki::Error::NotAcceptable' do
      expect(described_class.http_status_code_to_error_class(406)).to eq(Ioki::Error::NotAcceptable)
    end

    it 'resolves 409 to Ioki::Error::Conflict' do
      expect(described_class.http_status_code_to_error_class(409)).to eq(Ioki::Error::Conflict)
    end

    it 'resolves 422 to Ioki::Error::UnprocessableEntity' do
      expect(described_class.http_status_code_to_error_class(422)).to eq(Ioki::Error::UnprocessableEntity)
    end

    it 'resolves 500 to Ioki::Error::InternalServerError' do
      expect(described_class.http_status_code_to_error_class(500)).to eq(Ioki::Error::InternalServerError)
    end

    it 'resolves 123 to Ioki::Error::UnexpectedResponseCode' do
      expect(described_class.http_status_code_to_error_class(123)).to eq(Ioki::Error::UnexpectedResponseCode)
    end
  end
end
