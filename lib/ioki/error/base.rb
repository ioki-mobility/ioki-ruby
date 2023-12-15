# frozen_string_literal: true

module Ioki
  module Error
    class Base < StandardError
      attr_accessor :http_response

      def initialize(http_response)
        @http_response = http_response
        super(http_response_message)
      end

      def http_response_message
        [
          http_response&.status,
          http_response&.env&.url,
          http_response&.body
        ].join ' | '
      end

      def api_error
        return @api_error if defined?(@api_error)

        if http_response.status.to_s[0] == '4'
          @api_error = http_response.body
        end

        @api_error
      end
    end
  end
end
