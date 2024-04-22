# frozen_string_literal: true

module Ioki
  class Configuration
    DEFAULT_VALUES =
      {
        api_base_url:                 'https://app.io.ki/api/',
        api_version:                  '20210101',
        api_bleeding_edge:            false,
        language:                     'de',
        logger_options:               { headers: true, bodies: false, log_level: :info },
        retry_count:                  3,
        retry_sleep_seconds:          1,
        ignore_deprecated_attributes: false,
        proxy_url:                    nil,
        verify_ssl:                   true
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
      :language,
      :oauth_app_id,
      :oauth_app_secret,
      :oauth_app_url,
      :oauth_access_token,
      :oauth_refresh_token,
      :oauth_token_callback,
      :retry_count,
      :retry_sleep_seconds,
      :ignore_deprecated_attributes,
      :proxy_url,
      :verify_ssl
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
      @oauth_app_id = params[:oauth_app_id]
      @oauth_app_secret = params[:oauth_app_secret]
      @oauth_app_url = params[:oauth_app_url]
      @oauth_access_token = params[:oauth_access_token]
      @oauth_refresh_token = params[:oauth_refresh_token]
      @oauth_token_callback = params[:oauth_token_callback]
      @retry_count = params[:retry_count]
      @retry_sleep_seconds = params[:retry_sleep_seconds]
      @ignore_deprecated_attributes = params[:ignore_deprecated_attributes]
      @proxy_url = params[:proxy_url]
      @verify_ssl = params[:verify_ssl]
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
        api_base_url:                 ENV.fetch("#{prefix}_API_BASE_URL", nil),
        api_version:                  ENV.fetch("#{prefix}_API_VERSION", nil),
        api_client_identifier:        ENV.fetch("#{prefix}_API_CLIENT_IDENTIFIER", nil),
        api_client_secret:            ENV.fetch("#{prefix}_API_CLIENT_SECRET", nil),
        api_client_version:           ENV.fetch("#{prefix}_API_CLIENT_VERSION", nil),
        api_token:                    ENV.fetch("#{prefix}_API_TOKEN", nil),
        api_bleeding_edge:            ENV.fetch("#{prefix}_API_BLEEDING_EDGE", nil)&.downcase == 'true',
        oauth_app_id:                 ENV.fetch("#{prefix}_OAUTH_APP_ID", nil),
        oauth_app_secret:             ENV.fetch("#{prefix}_OAUTH_APP_SECRET", nil),
        oauth_app_url:                ENV.fetch("#{prefix}_OAUTH_APP_URL", nil),
        retry_count:                  ENV.fetch("#{prefix}_RETRY_COUNT", nil),
        retry_sleep_seconds:          ENV.fetch("#{prefix}_RETRY_SLEEP_SECONDS", nil),
        ignore_deprecated_attributes: ENV.fetch("#{prefix}_IGNORE_DEPRECATED_ATTRIBUTES", nil),
        proxy_url:                    ENV.fetch("#{prefix}_PROXY_URL", nil),
        verify_ssl:                   ENV.fetch("#{prefix}_VERIFY_SSL", 'true')&.downcase == 'true'
      }.reject { |_key, value| value.nil? || value.to_s == '' }
    end

    def token
      @api_token.nil? ? @oauth_access_token : @api_token
    end

    def oauth_enabled?
      [
        @oauth_app_id,
        @oauth_app_secret,
        @oauth_app_url
      ].all? { |option| !option.nil? && option.strip.length > 0 }
    end

    def reinitialize_http_adapter
      return if custom_http_adapter

      self.http_adapter = Ioki::HttpAdapter.get(self)
    end
  end
end
