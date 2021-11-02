# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::PassengerApi do
  let(:passenger_client) do
    Ioki::Client.new(
      instance_double(
        Ioki::Configuration,
        :config,
        api_base_url:          'https://app.io.ki/api',
        api_version:           '1',
        api_client_identifier: 'ID',
        api_client_secret:     'SECRET',
        api_client_version:    'VERSION',
        api_token:             'TOKEN',
        language:              'de'
      ),
      described_class
    )
  end
  let(:result_with_data) { instance_double(Hash, 'result double with data', '[]' => {}) }
  let(:result_with_index_data) { instance_double(Hash, 'result double with data', '[]' => [{}]) }
  let(:full_response) { instance_double(Faraday::Response, 'full_response', headers: {}) }
  let(:options) { { options: :example } }

  describe '#products' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/products')
        result_with_index_data
      end

      expect(passenger_client.products(options)).
        to eq([Ioki::Model::Passenger::Product.new])
    end
  end

  describe '#product(id)' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/products/0815')
        [result_with_data, full_response]
      end

      expect(passenger_client.product('0815', options)).
        to eq(Ioki::Model::Passenger::Product.new)
    end
  end

  describe '#station(id)' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/stations/0815')
        [result_with_data, full_response]
      end

      expect(passenger_client.station('0815', options)).
        to eq(Ioki::Model::Passenger::Station.new)
    end
  end

  describe '#bootstrap' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/bootstrap')
        [result_with_data, full_response]
      end

      expect(passenger_client.bootstrap(options)).
        to eq(Ioki::Model::Passenger::Bootstrap.new)
    end
  end

  describe '#create_ride_inquiry' do
    let(:ride_inquiry) { Ioki::Model::Passenger::RideInquiry.new }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/ride_inquiry')
        result_with_data
      end

      expect(passenger_client.create_ride_inquiry(ride_inquiry, options)).
        to eq(Ioki::Model::Passenger::RideInquiry.new)
    end
  end

  describe '#create_ride' do
    let(:ride) { Ioki::Model::Passenger::Ride.new }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/rides')
        result_with_data
      end

      expect(passenger_client.create_ride(ride, options)).
        to eq(Ioki::Model::Passenger::Ride.new)
    end
  end

  describe '#create_cancellation' do
    let(:ride) { Ioki::Model::Passenger::Ride.new(id: 'RIDE_ID') }
    let(:cancellation) do
      Ioki::Model::Passenger::Cancellation.new(ride_id: 'RIDE_ID', passenger_cancellation_reason: 'Too much traffic')
    end

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/rides/RIDE_ID/cancellation')
        expect(params[:body]).to eq(
          {
            data: {
              ride_id:                       'RIDE_ID',
              ride_version:                  nil,
              code:                          nil,
              passenger_cancellation_reason: 'Too much traffic'
            }
          }.to_json
        )

        result_with_data
      end

      expect(passenger_client.create_cancellation(ride, cancellation)).
        to eq(Ioki::Model::Passenger::Ride.new)
    end
  end

  describe '#create_booking' do
    let(:ride) { Ioki::Model::Passenger::Ride.new(id: 'RIDE_ID') }
    let(:booking) { Ioki::Model::Passenger::Booking.new(ride_version: 2) }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/rides/RIDE_ID/booking')
        expect(params[:body]).to eq '{"data":{"ride_version":2,"payment_method":null}}'
        result_with_data
      end

      expect(passenger_client.create_booking(ride, booking, options)).
        to eq(Ioki::Model::Passenger::Booking.new)
    end
  end

  describe '#create_phone_verification_request' do
    let(:phone_verification_request) do
      Ioki::Model::Passenger::PhoneVerificationRequest.new(phone_number: '491601234567')
    end

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/phone_verification_requests')
        result_with_data
      end

      expect(passenger_client.create_phone_verification_request(phone_verification_request, options)).
        to eq(Ioki::Model::Passenger::PhoneVerificationRequest.new)
    end
  end

  describe '#update_user_phone_number' do
    let(:user_phone_number) { Ioki::Model::Passenger::UserPhoneNumber.new(phone_number: '491601234567', code: 'HALLO') }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/user/phone_number')
        result_with_data
      end

      expect(passenger_client.update_user_phone_number(user_phone_number, options.merge(model: user_phone_number))).
        to eq(Ioki::Model::Passenger::User.new)
    end
  end

  describe '#update_user' do
    let(:email) { Ioki::Model::Passenger::UserEmail.new(email_address: 'patrician@example.com') }
    let(:user) do
      Ioki::Model::Passenger::User.new(first_name: 'Lupe', last_name: 'Smiles', email: email, terms_accepted: true)
    end

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/user')
        expect(JSON.parse(params[:body])['data']).
          to match(hash_including('first_name' => 'Lupe', 'last_name' => 'Smiles'))

        result_with_data
      end

      expect(passenger_client.update_user(user, options)).
        to eq(Ioki::Model::Passenger::User.new)
    end
  end

  describe '#show_user' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/user')
        [result_with_data, full_response]
      end

      expect(passenger_client.user(options)).to eq(Ioki::Model::Passenger::User.new)
    end
  end

  describe '#create_rating' do
    let(:ride) { Ioki::Model::Passenger::Ride.new(id: 'RIDE_ID') }
    let(:rating) { Ioki::Model::Passenger::Rating.new(ride_id: 'RIDE_ID') }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/rides/RIDE_ID/rating')
        result_with_data
      end

      expect(passenger_client.create_rating(ride, rating,
                                            options)).to eq(Ioki::Model::Passenger::Rating.new)
    end
  end

  describe '#update_language' do
    it 'internally dispatches to the correct client methods' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('https://app.io.ki/api/passenger/user/language')
        result_with_data
      end
      expect(passenger_client.config).to receive(:language=).with('fr')

      expect(passenger_client.update_language('fr')).to eq(result_with_data)
    end
  end
end
