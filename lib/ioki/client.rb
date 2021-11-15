# frozen_string_literal: true

require 'json'

module Ioki
  class Client
    VALID_API_NAMESPACES = [:platform, :passenger, :driver].freeze

    attr_accessor :config

    def initialize(config, api)
      @config = config

      api::ENDPOINTS.flatten.compact.each do |endpoint|
        define_singleton_method(endpoint.name) do |*args|
          # Each method defined by the API takes `args` matching the symbols in an enpoint's path, while the last
          # parameter is an optional options hash. The last argument that's not the options hash is also the required
          # model for Update and Create enpoints.
          #
          # Examples:
          # path: ['products', :id] -> `list_products(product)` or `list_products(product_id)
          # path: ['products', :id] -> `list_products(product, auto_paginate: true)`
          # path: ['products', :id, 'rides', :id] -> `list_rides(product, ride_id)`

          options = args.last.is_a?(::Hash) ? args.pop : {}
          model = args.last

          if [Endpoints::Create, Endpoints::Update].include?(endpoint.class)
            endpoint.call(self, model, args, options)
          else
            endpoint.call(self, args, options)
          end
        end
      end
    end

    # This is the "working horse method", which then delegates to the adapter
    # class.
    # On this "layer" we
    # - unpack params from the options hash and move them onto the URL
    # - test the response status and throw a potential Ioki::Error
    def request(url:, method: :get, body: nil, headers: [], params: nil, logger: nil)
      raise ArgumentError, 'Pass url as a proper URI' unless url.is_a?(URI)

      if params
        query_params = URI.decode_www_form(url.query || '')
        new_keys = params.keys.map(&:to_s)
        query_params = query_params.reject { |k, _v| new_keys.include?(k.to_s) }
        params.each { |k, v| query_params << [k.to_s, v] }
        url.query = URI.encode_www_form(query_params)
      end

      logger ||= config.logger if config.verbose_output

      response = http_adapter_class.request(
        url:     url,
        method:  method,
        body:    body,
        headers: headers,
        logger:  logger
      )

      error_class = Ioki::Error.http_status_code_to_error_class(response.status)

      raise error_class.new(http_response: response) if error_class

      parsed_response = nil

      if response.body && !response.body.empty?
        begin
          parsed_response = JSON.parse(response.body)
        rescue JSON::ParserError
          raise Ioki::Error::ResponseMalformed
        end
      end

      return parsed_response, response
    end

    def build_request_url(api_namespace, *url_fragments)
      if !VALID_API_NAMESPACES.include?(api_namespace.to_sym)
        raise ArgumentError, "Unknown api namespace '#{api_namespace}'"
      end

      fragments = [config.api_base_url, api_namespace.to_s] + url_fragments.map(&:to_s)
      fragments = fragments.map { |f| f.delete_prefix('/').delete_suffix('/') }

      URI.parse(fragments.join('/'))
    end

    def default_headers
      {
        'Content-Type'    => 'application/json',
        'Accept'          => 'application/json',
        'Accept-Language' => config.language.to_s
      }
    end

    def api_headers
      {
        'X-Api-Version' => config.api_version
      }
    end

    def client_headers
      {
        'X-Client-Identifier' => config.api_client_identifier,
        'X-Client-Secret'     => config.api_client_secret,
        'X-Client-Version'    => config.api_client_version
      }
    end

    def auth_headers
      {
        'Authorization' => "Bearer #{config.api_token}"
      }
    end

    def etag_header(etag)
      {
        'If-None-Match' => etag
      }
    end

    def all_headers(skip_auth: false, etag: nil)
      headers = {}

      headers.merge!(default_headers)
      headers.merge!(api_headers)
      headers.merge!(client_headers)
      headers.merge!(auth_headers) unless skip_auth
      headers.merge!(etag_header(etag)) if etag

      headers
    end

    def http_adapter_class
      config.http_adapter_class
    end
  end
end
