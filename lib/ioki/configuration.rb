# frozen_string_literal: true

require 'ioki/std_out_logger'

module Ioki
  class Configuration
    DEFAULT_HTTP_ADAPTER            = 'faraday'
    DEFAULT_API_BASE_URL            = 'https://app.io.ki/api/'
    DEFAULT_API_VERSION             = '20210101'

    CONFIG_KEYS = [
      :http_adapter,
      :verbose_output,
      :logger,
      :api_base_url,
      :api_version,
      :api_client_identifier,
      :api_client_secret,
      :api_client_version,
      :api_token,
      :language
    ].freeze

    attr_accessor(*CONFIG_KEYS)

    def initialize(params = {})
      @http_adapter = (params[:http_adapter] || DEFAULT_HTTP_ADAPTER).to_sym
      @verbose_output = params[:verbose_output] == 'true'
      @logger = params[:logger] || Ioki::StdOutLogger.new
      @api_base_url = params[:api_base_url] || DEFAULT_API_BASE_URL
      @api_version = params[:api_version] || DEFAULT_API_VERSION
      @api_client_identifier = params[:api_client_identifier]
      @api_client_secret = params[:api_client_secret]
      @api_client_version = params[:api_client_version]
      @api_token = params[:api_token]
      @language = params[:language] || 'de'
    end

    def reset!
      @http_adapter = (ENV['IOKI_HTTP_ADAPTER'] || DEFAULT_HTTP_ADAPTER).to_sym
      @verbose_output = ENV['IOKI_VERBOSE_OUTPUT'] == 'true'
      @logger = Ioki::StdOutLogger.new
      @api_base_url = ENV['IOKI_API_BASE_URL'] || DEFAULT_API_BASE_URL
      @api_version = ENV['IOKI_API_VERSION'] || DEFAULT_API_VERSION
      @api_client_identifier = ENV['IOKI_API_CLIENT_IDENTIFIER']
      @api_client_secret = ENV['IOKI_API_CLIENT_SECRET']
      @api_client_version = ENV['IOKI_API_CLIENT_VERSION']
      @api_token = ENV['IOKI_API_TOKEN']
      @language = 'de'
    end
  end
end
