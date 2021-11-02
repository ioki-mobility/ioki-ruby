# frozen_string_literal: true

require 'faraday'

module Ioki
  module HttpAdapter
    class Faraday < Ioki::HttpAdapter::Base
      def self.perform_request(method, url, body, headers)
        connection = ::Faraday.new do |f|
          f.request :url_encoded
          f.adapter :net_http
        end

        connection.run_request(method, url, body, headers)
      end
    end
  end
end
