# frozen_string_literal: true

module Ioki
  module Error
    class Base < StandardError
      attr_accessor :http_response

      def initialize(message = nil, http_response: nil)
        super(message)

        @http_response = http_response
      end

      def api_error
        return @api_error if defined?(@api_error)

        if http_response.status.to_s[0] == '4'
          @api_error = begin
            JSON.parse(http_response.body)
          rescue JSON::ParserError
            nil
          end
        end

        @api_error
      end
    end
  end
end
