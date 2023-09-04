# frozen_string_literal: true

require 'oauth2'
require_relative '../error/oauth_refresh_token'

module Ioki
  module Oauth
    class TokenRefresh
      extend Forwardable

      def_delegators :@config,
                     :oauth_app_id,
                     :oauth_app_secret,
                     :oauth_app_url,
                     :oauth_access_token,
                     :oauth_refresh_token,
                     :oauth_token_callback

      def initialize(config)
        @config = config
      end

      def call
        if oauth_refresh_token.nil? || oauth_refresh_token.strip.length <= 0
          raise Ioki::Error::OauthRefreshToken,
                'Refresh token is blank, please sign in via OAuth to get a new refresh token.'
        end

        new_token = begin
          oauth_token.refresh!
        rescue StandardError
          nil
        end

        if new_token.nil?
          raise Ioki::Error::OauthRefreshToken, 'Failed to retrieve a new OAuth access token.'
        end

        @config.oauth_access_token = new_token.token
        @config.oauth_refresh_token = new_token.refresh_token

        @config.reinitialize_http_adapter
        @config.oauth_token_callback&.call(new_token)

        new_token
      end

      private

      def oauth_client
        OAuth2::Client.new(
          oauth_app_id,
          oauth_app_secret,
          site: oauth_app_url
        )
      end

      def oauth_token
        OAuth2::AccessToken.new(
          oauth_client,
          oauth_access_token,
          refresh_token: oauth_refresh_token
        )
      end
    end
  end
end
