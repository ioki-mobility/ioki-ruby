# frozen_string_literal: true

require 'spec_helper'
require 'ioki/apis/endpoints/endpoints'

class PingApi
  ENDPOINTS =
    [
      Ioki::Endpoints::Index.new(
        :ping,
        base_path:   ['driver'],
        model_class: Ioki::Model::Base
      )
    ].freeze
end

RSpec.describe Ioki::Oauth::WithTokenRefresh do
  let(:client) { Ioki::Client.new(config, PingApi) }

  context 'with oauth configuration' do
    let(:config) do
      Ioki::Configuration.new(
        oauth_app_id:        'dummy-app',
        oauth_app_secret:    'dummy-app-secret',
        oauth_app_url:       'https://dummy-oauth.example.com',
        oauth_access_token:  'dummy-access-token',
        oauth_refresh_token: 'dummy-refresh-token'
      )
    end

    it 'sends the oauth access token as an API token' do
      ping_request = stub_request(:get, 'https://app.io.ki/api/driver/ping')
        .with(
          headers: { 'Authorization' => 'Bearer dummy-access-token' }
        )
        .to_return(status: 200, body: '{"data": []}', headers: { content_type: 'application/json' })

      client.ping

      expect(ping_request).to have_been_requested.once
    end

    it 'refreshes the oauth access token' do
      updated_token = nil
      config.oauth_token_callback = proc { |tokens| updated_token = tokens.token }

      invalid_token_request = stub_request(:get, 'https://app.io.ki/api/driver/ping')
        .with(
          headers: { 'Authorization' => 'Bearer dummy-access-token' }
        )
        .to_return(status: 401, body: '{"data": []}', headers: { content_type: 'application/json' })

      expect_any_instance_of(OAuth2::AccessToken)
        .to receive(:refresh!)
        .and_return(instance_double(OAuth2::AccessToken, token: 'correct-token', refresh_token: 'new-refresh-token'))
      valid_token_request = stub_request(:get, 'https://app.io.ki/api/driver/ping')
        .with(
          headers: { 'Authorization' => 'Bearer correct-token' }
        )
        .to_return(status: 200, body: '{"data": []}', headers: { content_type: 'application/json' })

      client.ping

      expect(invalid_token_request).to have_been_requested.once
      expect(valid_token_request).to have_been_requested.once
      expect(config.oauth_access_token).to eq 'correct-token'
      expect(updated_token).to eq 'correct-token'
    end

    it 'raises when there is no refresh token' do
      stub_request(:get, 'https://app.io.ki/api/driver/ping')
        .with(
          headers: { 'Authorization' => 'Bearer dummy-access-token' }
        )
        .to_return(status: 401, body: '{"data": []}', headers: { content_type: 'application/json' })

      config.oauth_refresh_token = nil

      expect do
        client.ping
      end.to raise_error Ioki::Error::OauthRefreshToken
    end

    it 'raises when the refresh token is invalid' do
      invalid_token_request = stub_request(:get, 'https://app.io.ki/api/driver/ping')
        .with(
          headers: { 'Authorization' => 'Bearer dummy-access-token' }
        )
        .to_return(status: 401, body: '{"data": []}', headers: { content_type: 'application/json' })

      expect_any_instance_of(OAuth2::AccessToken).to receive(:refresh!).and_raise OAuth2::Error

      expect do
        client.ping
      end.to raise_error Ioki::Error::OauthRefreshToken

      expect(invalid_token_request).to have_been_requested.once
      expect(config.oauth_access_token).to eq 'dummy-access-token'
    end
  end

  context 'without oauth configuration' do
    let(:config) do
      Ioki::Configuration.new(
        api_token: 'dummy-token'
      )
    end

    it 'sends the API token' do
      ping_request = stub_request(:get, 'https://app.io.ki/api/driver/ping')
        .with(
          headers: { 'Authorization' => 'Bearer dummy-token' }
        )
        .to_return(status: 200, body: '{"data": []}', headers: { content_type: 'application/json' })

      client.ping

      expect(ping_request).to have_been_requested.once
    end
  end
end
