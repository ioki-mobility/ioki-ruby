# frozen_string_literal: true

require 'ioki/std_out_logger'

module Ioki
  class Configuration
    DEFAULT_VALUES =
      {
        http_adapter: :faraday,
        api_base_url: 'https://app.io.ki/api/',
        api_version:  '20210101',
        language:     'de'
      }.freeze

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

    def initialize(params = DEFAULT_VALUES)
      @http_adapter = params[:http_adapter]
      @verbose_output = ['true', true].include?(params[:verbose_output])
      @logger = params[:logger] || Ioki::StdOutLogger.new
      @api_base_url = params[:api_base_url]
      @api_version = params[:api_version]
      @api_client_identifier = params[:api_client_identifier]
      @api_client_secret = params[:api_client_secret]
      @api_client_version = params[:api_client_version]
      @api_token = params[:api_token]
      @language = params[:language]
    end

    def self.from_env(env_prefix = '')
      new(DEFAULT_VALUES.merge(values_from_env(env_prefix)))
    end

    def reset!
      CONFIG_KEYS.each do |key|
        send("#{key}=", DEFAULT_VALUES.merge(self.class.values_from_env)[key])
      end
      @logger = Ioki::StdOutLogger.new
    end

    def self.values_from_env(env_prefix = '')
      prefix = ['IOKI', env_prefix].reject(&:empty?).join('_')

      {
        http_adapter:          ENV["#{prefix}_HTTP_ADAPTER"],
        verbose_output:        ENV["#{prefix}_VERBOSE_OUTPUT"] == 'true',
        api_base_url:          ENV["#{prefix}_API_BASE_URL"],
        api_version:           ENV["#{prefix}_API_VERSION"],
        api_client_identifier: ENV["#{prefix}_API_CLIENT_IDENTIFIER"],
        api_client_secret:     ENV["#{prefix}_API_CLIENT_SECRET"],
        api_client_version:    ENV["#{prefix}_API_CLIENT_VERSION"],
        api_token:             ENV["#{prefix}_API_TOKEN"]
      }.compact
    end

    def http_adapter_class
      http_adapter.to_s == 'test' ? Ioki::HttpAdapter::Test : Ioki::HttpAdapter::Faraday
    end
  end
end
