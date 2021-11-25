# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module Ioki
  class HttpAdapter

    def self.get(config)
      ::Faraday.new(config.api_base_url, headers: headers(config)) do |f|
        f.adapter :net_http

        # The order of execution of the middleware is FiFo:
        # 1) parsed as JSON (and implicitly is encoded properly as UTF-8)
        # 2) logging occurs
        if config.logger
          f.response :logger, config.logger, config.logger_options do |logger|
            logger.filter(/(X-Client-Secret: )(\w+)/, '\1[REMOVED]')
            logger.filter(/(Authorization: )(\w+)/, '\1[REMOVED]')
            logger.filter(/("token":")([^"]+)/, '\1[REMOVED]')
          end
        end
        f.response :json # decode response bodies as JSON

        f.request :json # encode req bodies as JSON
        f.request :authorization, 'Bearer', -> { config.api_token }
      end
    end

    def self.headers(config)
      {
        # default_headers
        'Content-Type'        => 'application/json',
        'Accept'              => 'application/json',
        'Accept-Language'     => config.language.to_s,
        # api_headers
        'X-Api-Version'       => config.api_version,
        # client_headers
        'X-Client-Identifier' => config.api_client_identifier,
        'X-Client-Secret'     => config.api_client_secret,
        'X-Client-Version'    => config.api_client_version
      }
    end
  end
end
