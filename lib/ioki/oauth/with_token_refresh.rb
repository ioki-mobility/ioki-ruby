# frozen_string_literal: true

require_relative 'token_refresh'

module Ioki
  module Oauth
    class WithTokenRefresh
      def initialize(config)
        @config = config
        @retries = 2
      end

      def self.call(config, &block)
        new(config).call(&block)
      end

      def call
        yield
      rescue Ioki::Error::Unauthorized => e
        raise e unless @config.oauth_enabled?

        @retries -= 1

        if Ioki::Oauth::TokenRefresh.new(@config).call
          if @retries > 0
            retry
          else
            raise e
          end
        else
          raise e
        end
      end
    end
  end
end
