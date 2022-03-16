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
      def initialize(signature:, body:)
        @signature = signature
        @body = body
      end

      def call
        raise Ioki::Error::WebhookSignatureMissing if blank? @signature
        raise Ioki::Error::WebhookBodyMissing if blank? @body
        raise Ioki::Error::WebhookSignatureKeyMissing if blank? ENV['WEBHOOK_SIGNATURE_KEY']
        raise Ioki::Error::WebhookSignatureInvalid unless secure_compare @signature, calculated_signature
      end

      private

      def calculated_signature
        'sha256=' + OpenSSL::HMAC.hexdigest(
          OpenSSL::Digest.new('sha256'), # The algorithm to use: SHA256
          ENV['WEBHOOK_SIGNATURE_KEY'],  # First: The pre-shared key
          @body                          # Second: The data to verify
        )
      end

      # almost verbatim copy of ActiveSupport::SecurityUtils#fixed_length_secure_compare
      def secure_compare(a, b)
        raise Ioki::Error::WebhookSignatureInvalid unless a.bytesize == b.bytesize

        l = a.unpack "C#{a.bytesize}"

        res = 0
        b.each_byte { |byte| res |= byte ^ l.shift }
        res == 0
      end

      def blank?(val)
        val.nil? || val == ''
      end
    end
  end
end
