# frozen_string_literal: true

module Ioki
  module HttpAdapter
    class Base
      class << self
        # return value is expected to fulfill the "faraday response contract":
        # an object that responds to status, headers and body
        def request(url:, method: :get, body: nil, headers: [], logger: nil)
          raise ArgumentError, 'Pass url as a proper URI' unless url.is_a?(URI)

          print_request_debug_out(logger, method, url, body, headers)

          response = perform_request(method, url, body, headers)

          print_response_debug_out(logger, response)

          response
        end

        protected

        def perform_request(_method, _url, _body, _headers)
          raise 'Implement in subclass'
        end

        def print_request_debug_out(logger, method, url, body, headers)
          return unless logger

          logger.debug "Adapter: #{name}"
          logger.debug ''

          logger.debug 'Request:'
          logger.debug "URL: #{method.upcase} #{url} HTTP/1.1"
          logger.debug 'Request Headers:'

          headers.each { |k, v| logger.debug "  #{k}: #{v}" }

          logger.debug 'Request Body:'

          if body && !body.empty?
            logger.debug body.to_s + ''
          else
            logger.debug '<empty body>'
          end
          logger.debug ''
        end

        def print_response_debug_out(logger, response)
          return unless logger

          logger.debug 'Response:'
          logger.debug "Status: #{response.status}"

          logger.debug 'Response Headers:'
          response.headers.each { |k, v| puts "  #{k}: #{v}" }

          logger.debug 'Response Body:'

          if response.body && !response.body.empty?
            logger.debug response.body.to_s + ''
          else
            logger.debug '<empty body>'
          end
          logger.debug ''
        end
      end
    end
  end
end
