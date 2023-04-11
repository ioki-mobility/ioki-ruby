# frozen_string_literal: true

require 'spec_helper'
require 'time'
require 'securerandom'

RSpec.describe Ioki::Webhooks::SignatureValidator do
  subject(:validator) do
    described_class.new signature: signature, body: body, signature_key: signature_key
  end

  let(:body) do
    {
      id:          "wev_#{rand(1E9)}",
      type:        'webhook_event',
      api_version: '20201201',
      provider_id: "prv_#{rand(1E9)}",
      event_type:  'user.created',
      created_at:  Time.now.iso8601,
      data:        {
        id: "usr_#{rand(1E9)}"
      }
    }.to_json
  end
  let(:signature) { 'sha256=' + signature_sha256 }
  let(:signature_sha256) { 'NotAnActualSignatureButItHasTheCorrectLengthSoThatsFineAndOkayOK' }
  let(:signature_key) { 'signature_key' }

  context 'when signature is nil' do
    let(:signature) { nil }

    it 'raises a Ioki::Error::WebhookSignatureMissing' do
      expect { validator.call }.to raise_error Ioki::Error::WebhookSignatureMissing
    end
  end

  context 'when signature is empty' do
    let(:signature) { '' }

    it 'raises a Ioki::Error::WebhookSignatureMissing' do
      expect { validator.call }.to raise_error Ioki::Error::WebhookSignatureMissing
    end
  end

  context 'when body is nil' do
    let(:body) { nil }

    it 'raises a Ioki::Error::WebhookBodyMissing' do
      expect { validator.call }.to raise_error Ioki::Error::WebhookBodyMissing
    end
  end

  context 'when body is empty' do
    let(:body) { '' }

    it 'raises a Ioki::Error::WebhookBodyMissing' do
      expect { validator.call }.to raise_error Ioki::Error::WebhookBodyMissing
    end
  end

  context 'when the signature_key is nil' do
    let(:signature_key) { nil }

    it 'raises a Ioki::Error::WebhookSignatureKeyMissing' do
      expect { validator.call }.to raise_error Ioki::Error::WebhookSignatureKeyMissing
    end
  end

  context 'when the signature_key is empty' do
    let(:signature_key) { '' }

    it 'raises a Ioki::Error::WebhookSignatureKeyMissing' do
      expect { validator.call }.to raise_error Ioki::Error::WebhookSignatureKeyMissing
    end
  end

  context 'when the signature_key is present' do
    let(:signature_key) { SecureRandom.alphanumeric(24) }

    it 'raises a Ioki::Error::WebhookSignatureInvalid' do
      expect { validator.call }.to raise_error Ioki::Error::WebhookSignatureInvalid
    end

    it 'does not raise an error when signature matches' do
      allow(OpenSSL::HMAC).to receive(:hexdigest).and_return(signature_sha256)
      expect { validator.call }.not_to raise_error
    end

    context 'when the signature hash does not match' do
      let(:signature_sha256) { 'NotAMatchingSignatureButItHasTheCorrectLengthSoThatsFineAndOkayO' }

      it 'raises a WebhookSignatureInvalid error' do
        expect { validator.call }.to raise_error Ioki::Error::WebhookSignatureInvalid
      end
    end

    context 'when the signature hash is too short' do
      let(:signature_sha256) { 'NotAMatchingSignature' }

      it 'raises a WebhookSignatureInvalid error' do
        expect { validator.call }.to raise_error Ioki::Error::WebhookSignatureInvalid
      end
    end

    it 'validates the signature using OpenSSL::HMAC SHA256 with WEBHOOK_SIGNATURE_KEY over body' do
      expect(OpenSSL::HMAC).to receive(:hexdigest).with(
        OpenSSL::Digest.new('sha256'),
        signature_key,
        body
      ).and_return(signature_sha256)
      validator.call
    end

    context 'when the signature is correctly calculated' do
      let(:signature_sha256) { OpenSSL::HMAC.hexdigest OpenSSL::Digest.new('sha256'), signature_key, body }

      it 'does not raise an error' do
        expect { validator.call }.not_to raise_error
      end
    end
  end
end
