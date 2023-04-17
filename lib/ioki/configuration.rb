# frozen_string_literal: true

module Ioki
  class Configuration
    DEFAULT_VALUES =
      {
        api_base_url:      'https://app.io.ki/api/',
        api_version:       '20210101',
        api_bleeding_edge: false,
        language:          'de',
        logger_options:    { headers: true, bodies: false, log_level: :info }
      }.freeze

    CONFIG_KEYS = [
      :http_adapter,
      :logger,
      :logger_options,
      :api_base_url,
      :api_version,
      :api_client_identifier,
      :api_client_secret,
      :api_client_version,
      :api_token,
      :api_bleeding_edge,
      :language
    ].freeze

    attr_accessor(*CONFIG_KEYS)
    attr_accessor :custom_http_adapter

    def initialize(params = {})
      params = DEFAULT_VALUES.merge(params)
      @logger = params[:logger]
      @logger_options = params[:logger_options]
      @api_base_url = params[:api_base_url]
      @api_version = params[:api_version]
      @api_client_identifier = params[:api_client_identifier]
      @api_client_secret = params[:api_client_secret]
      @api_client_version = params[:api_client_version]
      @api_token = params[:api_token]
      @api_bleeding_edge = params[:api_bleeding_edge]
      @language = params[:language]
      # you can pass in a custom Faraday::Connection instance:
      @http_adapter = params[:http_adapter] || Ioki::HttpAdapter.get(self)
      @custom_http_adapter = !!params[:http_adapter]
    end

    def self.from_env(env_prefix = '')
      new(DEFAULT_VALUES.merge(values_from_env(env_prefix)))
    end

    def reset!
      CONFIG_KEYS.each do |key|
        send("#{key}=", DEFAULT_VALUES.merge(self.class.values_from_env)[key])
      end
      @custom_http_adapter = nil
    end

    def self.values_from_env(env_prefix = '')
      prefix = ['IOKI', env_prefix].reject(&:empty?).join('_')

      {
        api_base_url:          ENV.fetch("#{prefix}_API_BASE_URL", nil),
        api_version:           ENV.fetch("#{prefix}_API_VERSION", nil),
        api_client_identifier: ENV.fetch("#{prefix}_API_CLIENT_IDENTIFIER", nil),
        api_client_secret:     ENV.fetch("#{prefix}_API_CLIENT_SECRET", nil),
        api_client_version:    ENV.fetch("#{prefix}_API_CLIENT_VERSION", nil),
        api_token:             ENV.fetch("#{prefix}_API_TOKEN", nil),
        api_bleeding_edge:     ENV.fetch("#{prefix}_API_BLEEDING_EDGE", nil)&.downcase == 'true'
      }.reject { |_key, value| value.nil? || value.to_s == '' }
    end
  end
end
