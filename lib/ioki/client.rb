# frozen_string_literal: true

require 'json'
require_relative 'oauth/with_token_refresh'

module Ioki
  class Client
    VALID_API_NAMESPACES = [:driver, :operator, :passenger, :platform].freeze

    attr_accessor :config

    def initialize(config, api)
      @config = config

      api::ENDPOINTS.flatten.compact.each do |endpoint|
        define_singleton_method(endpoint.name) do |*args, &block|
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

          if [
            Endpoints::Create,
            Endpoints::Update,
            Endpoints::UpdateSingular,
            Endpoints::DeleteSingular
          ].include?(endpoint.class)
            endpoint.call(self, model, args, options)
          elsif endpoint.is_a? Endpoints::Index
            endpoint.call(self, args, options, &block)
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
    def request(url:, method: :get, body: nil, headers: [], params: nil)
      raise ArgumentError, 'Pass url as a proper URI' unless url.is_a?(URI)

      if params
        query_params = URI.decode_www_form(url.query || '')
        new_keys = params.keys.map(&:to_s)
        query_params = query_params.reject { |k, _v| new_keys.include?(k.to_s) }
        params.each { |k, v| query_params << [k.to_s, v] }
        url.query = URI.encode_www_form(query_params)
      end

      Ioki::Oauth::WithTokenRefresh.call(config) do
        response = config.http_adapter.run_request(method, url, body, headers)

        error_class = Ioki::Error.http_status_code_to_error_class(response.status)

        raise error_class, response if error_class

        return response.body, response
      end
    end

    def build_request_url(api_namespace, *url_fragments)
      if !VALID_API_NAMESPACES.include?(api_namespace.to_sym)
        raise ArgumentError, "Unknown api namespace '#{api_namespace}'"
      end

      fragments = [api_namespace.to_s] + url_fragments.map(&:to_s)
      fragments = fragments.map { |f| f.delete_prefix('/').delete_suffix('/') }

      URI.parse(fragments.join('/'))
    end
  end
end
