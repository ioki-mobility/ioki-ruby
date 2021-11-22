# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Ioki::PassengerApi', :vcr do
  # Compare fixtures/vcr_cassettes for the recorded requests and responses for this example.

  setup_platform_client(:platform_client)
  setup_passenger_client(:passenger_client)

  describe "updating a user's phone number" do
    let(:new_phone_number) { '+16465550197' }

    it 'returns an updated user' do
      provider_id = platform_client.providers.first.id
      existing_user = platform_client.user(provider_id, 'usr_aa88fd04-c8d2-4d7b-bbea-2d6096bf5f28')

      passenger_client.config.api_token = platform_client.create_request_token(
        provider_id,
        existing_user.id,
        Ioki::Model::Platform::PassengerRequestToken.new(
          client_identifier: 'dev.passengerapi.test.backend'
        )
      ).token

      passenger_client.create_phone_verification_request(
        Ioki::Model::Passenger::PhoneVerificationRequest.new(phone_number: new_phone_number)
      )

      updated_user = passenger_client.update_user_phone_number(
        Ioki::Model::Passenger::UserPhoneNumber.new(phone_number: new_phone_number, code: '646197'),
        model: Ioki::Model::Passenger::UserPhoneNumber.new(phone_number: new_phone_number, code: '646197')
      )

      expect(updated_user).to be_a Ioki::Model::Passenger::User
      expect(existing_user.phone_number).not_to eq new_phone_number
      expect(updated_user.phone_number).to eq new_phone_number
    end
  end

  describe "updating a user's language" do
    it "sets the user's locale" do
      provider_id = platform_client.providers.first.id
      existing_user = platform_client.user(provider_id, 'usr_aa88fd04-c8d2-4d7b-bbea-2d6096bf5f28')

      passenger_client.config.api_token = platform_client.create_request_token(
        provider_id,
        existing_user.id,
        Ioki::Model::Platform::PassengerRequestToken.new(
          client_identifier: 'dev.passengerapi.test.backend'
        )
      ).token

      passenger_client.update_language('en')
      expect(passenger_client.user.locale).to eq 'en'
      passenger_client.update_language('de')
      expect(passenger_client.user.locale).to eq 'de'
    end
  end
end
