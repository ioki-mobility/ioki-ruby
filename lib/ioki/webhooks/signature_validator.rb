# frozen_string_literal: true

require 'openssl'

# Example usage in a rails controller:
#
# before_action :verify_signature
# def verify_signature
#   Ioki::Webhooks::SignatureValidator.new(signature: request.headers['X-Signature'], body: request.body.read).call
# rescue Ioki::Error::BodyMissing => error
#   render json: { status: :bad_request, error: 'Body missing' }, status: :bad_request
# rescue Ioki::Error::SignatureMissing => error
#   render json: { status: :bad_request, error: 'X-Signature header missing' }, status: :bad_request
# rescue Ioki::Error::SignatureInvalid => error
#   render json: { status: :bad_request, error: 'X-Signature header invalid' }, status: :bad_request
# end

module Ioki
  module Webhooks
    class SignatureValidator
      def initialize(body:, signature:, signature_key:)
        @body = body
        @signature = signature
        @signature_key = signature_key
      end

      def call
        raise Ioki::Error::WebhookSignatureMissing if Ioki::Support.blank? @signature
        raise Ioki::Error::WebhookBodyMissing if Ioki::Support.blank? @body
        raise Ioki::Error::WebhookSignatureKeyMissing if Ioki::Support.blank? @signature_key

        valid_signature = OpenSSL.secure_compare @signature, calculated_signature
        raise Ioki::Error::WebhookSignatureInvalid unless valid_signature
      end

      private

      def calculated_signature
        'sha256=' + OpenSSL::HMAC.hexdigest(
          OpenSSL::Digest.new('sha256'), # The algorithm to use: SHA256
          @signature_key,                # First: The pre-shared key
          @body                          # Second: The data to verify
        )
      end
    end
  end
end
