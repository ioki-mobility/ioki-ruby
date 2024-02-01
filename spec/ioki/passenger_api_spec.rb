# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::PassengerApi do
  let(:passenger_client) do
    Ioki::Client.new(
      Ioki::Configuration.new(
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
  let(:result_with_array_data) { instance_double(Hash, 'result double with data', '[]' => []) }
  let(:result_with_index_data) { instance_double(Hash, 'result double with data', '[]' => [{}]) }
  let(:full_response) { instance_double(Faraday::Response, 'full_response', headers: {}) }
  let(:options) { { options: :example } }

  describe '#products' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/products')
        result_with_index_data
      end

      expect(passenger_client.products(options)).to all(be_a(Ioki::Model::Passenger::Product))
    end
  end

  describe '#product(id)' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/products/0815')
        [result_with_data, full_response]
      end

      expect(passenger_client.product('0815', options)).to be_a Ioki::Model::Passenger::Product
    end
  end

  describe '#station(id)' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/stations/0815')
        [result_with_data, full_response]
      end

      expect(passenger_client.station('0815', options)).to be_a Ioki::Model::Passenger::Station
    end
  end

  describe '#stations' do
    let(:options) { { params: { product_id: 'prd_1', query: 'mystation' } } }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/stations')
        expect(params[:params]).to eq(options[:params])
        result_with_index_data
      end

      expect(passenger_client.stations([], options)).to all(be_a(Ioki::Model::Passenger::Station))
    end
  end

  describe '#bootstrap' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/bootstrap')
        [result_with_data, full_response]
      end

      expect(passenger_client.bootstrap(options)).to be_a Ioki::Model::Passenger::Bootstrap
    end
  end

  describe '#create_ride_inquiry' do
    let(:ride_inquiry) { Ioki::Model::Passenger::RideInquiry.new }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/ride_inquiry')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_ride_inquiry(ride_inquiry, options))
        .to be_a(Ioki::Model::Passenger::RideInquiry)
    end
  end

  describe '#create_ride' do
    let(:ride) { Ioki::Model::Passenger::Ride.new }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/rides')
        expect(params[:body][:data]).not_to have_key(:version)
        [result_with_data, full_response]
      end

      expect(passenger_client.create_ride(ride, options))
        .to be_a(Ioki::Model::Passenger::Ride)
    end
  end

  describe '#current_ride' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/rides/current')
        [result_with_data, full_response]
      end

      expect(passenger_client.current_ride(options)).to be_a Ioki::Model::Passenger::Ride
    end
  end

  describe '#create_cancellation' do
    let(:ride) { Ioki::Model::Passenger::Ride.new(id: 'RIDE_ID') }
    let(:cancellation) do
      Ioki::Model::Passenger::Cancellation.new(
        ride_id:                   'RIDE_ID',
        cancellation_statement_id: 'CANCELLATION_STATEMENT_ID'
      )
    end

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/rides/RIDE_ID/cancellation')
        expect(params[:body]).to eq(
          { data: { ride_version: nil, code: nil, cancellation_statement_id: 'CANCELLATION_STATEMENT_ID' } }
        )

        [result_with_data, full_response]
      end

      expect(passenger_client.create_cancellation(ride, cancellation))
        .to be_a(Ioki::Model::Passenger::Ride)
    end
  end

  describe '#create_booking' do
    let(:ride) { Ioki::Model::Passenger::Ride.new(id: 'RIDE_ID') }
    let(:booking) { Ioki::Model::Passenger::Booking.new(ride_version: 2) }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/rides/RIDE_ID/booking')
        expect(params[:body]).to eq({ data: { ride_version: 2 } })
        [result_with_data, full_response]
      end

      expect(passenger_client.create_booking(ride, booking, options))
        .to be_a(Ioki::Model::Passenger::Booking)
    end
  end

  describe '#create_phone_verification_request' do
    let(:phone_verification_request) do
      Ioki::Model::Passenger::PhoneVerificationRequest.new(phone_number: '491601234567')
    end

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/phone_verification_requests')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_phone_verification_request(phone_verification_request, options))
        .to be_a Ioki::Model::Passenger::PhoneVerificationRequest
    end
  end

  describe '#update_user_phone_number' do
    let(:user_phone_number) { Ioki::Model::Passenger::UserPhoneNumber.new(phone_number: '491601234567', code: 'HALLO') }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/user/phone_number')
        [result_with_data, full_response]
      end

      expect(passenger_client.update_user_phone_number(user_phone_number, options.merge(model: user_phone_number)))
        .to be_a Ioki::Model::Passenger::User
    end
  end

  describe '#update_user' do
    let(:email) { Ioki::Model::Passenger::Email.new(email_address: 'patrician@example.com') }
    let(:user) do
      Ioki::Model::Passenger::User.new(first_name: 'Lupe', last_name: 'Smiles', email: email, terms_accepted: true)
    end

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/user')
        expect(params[:body][:data]).to match(hash_including(first_name: 'Lupe', last_name: 'Smiles'))
        [result_with_data, full_response]
      end

      expect(passenger_client.update_user(user, options)).to be_a Ioki::Model::Passenger::User
    end
  end

  describe '#create_user_flags' do
    let(:user_flags) { Ioki::Model::Passenger::UserFlags.new(minimum_age_confirmed: true) }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/user/flags')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_user_flags(user_flags, options.merge(model: user_flags)))
        .to be_a Ioki::Model::Passenger::User
    end
  end

  describe '#show_user' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/user')
        [result_with_data, full_response]
      end
      expect(passenger_client.user(options)).to be_a Ioki::Model::Passenger::User
    end
  end

  describe '#create_rating' do
    let(:ride) { Ioki::Model::Passenger::Ride.new(id: 'RIDE_ID') }
    let(:rating) { Ioki::Model::Passenger::Rating.new(ride_id: 'RIDE_ID') }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/rides/RIDE_ID/rating')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_rating(ride, rating, options)).to be_a Ioki::Model::Passenger::Rating
    end
  end

  describe '#service_credits' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/service_credits')
        [result_with_data, full_response]
      end

      expect(passenger_client.service_credits).to all(be_a(Ioki::Model::Passenger::ServiceCredit))
    end
  end

  describe '#create_service_credit' do
    let(:service_credit) do
      Ioki::Model::Passenger::ServiceCreditCreate.new(
        payment_method: { payment_method_type: 'card' },
        cost:           500,
        value:          100
      )
    end

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/service_credits')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_service_credit(service_credit, options))
        .to be_a Ioki::Model::Passenger::ServiceCredit
    end
  end

  describe '#update_language' do
    it 'internally dispatches to the correct client methods' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/user/language')
        result_with_data
      end
      expect(passenger_client.config).to receive(:language=).with('fr')

      expect(passenger_client.update_language('fr')).to eq(result_with_data)
    end
  end

  describe '#create_logpay_customer' do
    let(:customer) do
      Ioki::Model::Passenger::LogpayCustomer.new(
        payment_method_type: 'card',
        email:               'muster@example.com',
        person:              Ioki::Model::Passenger::LogpayPerson.new(
          gender:   'FEMALE',
          forename: 'Sarah',
          surname:  'Muster',
          birth:    '1980-06-01'
        ),
        address_residence:   Ioki::Model::Passenger::LogpayAddressResidence.new(
          to1:       'Sarah Muster',
          street:    'Musterstrasse 13',
          post_code: '90000',
          place:     'Musterhausen',
          country:   'DE'
        )
      )
    end

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/logpay/customer')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_logpay_customer(customer)).to be_a Ioki::Model::Passenger::LogpayUrl
    end
  end

  describe '#create_logpay_payment_method' do
    let(:payment_method) do
      Ioki::Model::Passenger::LogpayPaymentMethod.new(
        payment_method_type: 'card'
      )
    end

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/logpay/payment_method')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_logpay_payment_method(payment_method)).to be_a Ioki::Model::Passenger::LogpayUrl
    end
  end

  describe '#payment_methods' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/payment_methods')
        [result_with_data, full_response]
      end

      expect(passenger_client.payment_methods).to all(be_a(Ioki::Model::Passenger::PaymentMethod))
    end
  end

  describe '#delete_payment_method' do
    let(:payment_method) { Ioki::Model::Passenger::PersonalDiscount.new(id: 'pam_1') }

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq("passenger/payment_methods/#{payment_method.id}")
        [result_with_data, full_response]
      end

      expect(passenger_client.delete_payment_method(payment_method))
        .to be_a Ioki::Model::Passenger::PaymentMethod
    end
  end

  describe '#personal_discounts' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/personal_discounts')
        [result_with_data, full_response]
      end

      expect(passenger_client.personal_discounts).to all(be_a(Ioki::Model::Passenger::PersonalDiscount))
    end
  end

  describe '#personal_discount_types' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/personal_discount_types')
        [result_with_data, full_response]
      end

      expect(passenger_client.personal_discount_types).to all(be_a(Ioki::Model::Passenger::PersonalDiscountType))
    end
  end

  describe '#create_personal_discount' do
    let(:personal_discount) do
      Ioki::Model::Passenger::PersonalDiscount.new(
        personal_discount_type_id: 'ped_1',
        payment_method:            {
          payment_method_type: 'card',
          id:                  'pam_1'
        }
      )
    end

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/personal_discounts')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_personal_discount(personal_discount))
        .to be_a Ioki::Model::Passenger::PersonalDiscount
    end
  end

  describe '#available_notification_settings' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/notification_settings/available')
        [result_with_array_data, full_response]
      end
      expect(passenger_client.available_notification_settings).to be_a Ioki::Model::Passenger::NotificationSettings
    end
  end

  describe '#default_notification_settings' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/notification_settings/defaults')
        [result_with_array_data, full_response]
      end
      expect(passenger_client.default_notification_settings).to be_a Ioki::Model::Passenger::NotificationSettings
    end
  end

  describe '#create_tip' do
    let(:ride) { Ioki::Model::Passenger::Ride.new(id: 'RIDE_ID') }
    let(:tip) do
      Ioki::Model::Passenger::TipCreate.new(
        amount:         100,
        payment_method: {
          payment_method_type: 'card',
          id:                  'pam_1'
        }
      )
    end

    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/rides/RIDE_ID/tip')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_tip(ride, tip))
        .to be_a Ioki::Model::Passenger::Tip
    end
  end

  describe '#create_logpay_paypal_client_token' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/logpay/paypal_client_token')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_logpay_paypal_client_token(
               Ioki::Model::Passenger::LogpayPaypalClientToken.new
             ))
        .to be_a Ioki::Model::Passenger::LogpayPaypalClientToken
    end
  end

  describe '#create_payment_method' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/payment_methods')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_payment_method(
               Ioki::Model::Passenger::PaymentMethod.new(payment_method_type: 'logpay')
             ))
        .to be_a Ioki::Model::Passenger::PaymentMethod
    end
  end

  describe '#stripe_setup_intent' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/payment_methods/setup_intent')
        [result_with_data, full_response]
      end

      expect(passenger_client.stripe_setup_intent)
        .to be_a Ioki::Model::Passenger::StripeSetupIntent
    end
  end

  describe '#redeemed_promo_codes' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/redeemed_promo_codes')
        [result_with_array_data, full_response]
      end
      expect(passenger_client.redeemed_promo_codes).to all be_a Ioki::Model::Passenger::RedeemedPromoCode
    end
  end

  describe '#create_redeemed_promo_code' do
    it 'calls request on the client with expected params' do
      expect(passenger_client).to receive(:request) do |params|
        expect(params[:url].to_s).to eq('passenger/redeemed_promo_codes')
        [result_with_data, full_response]
      end

      expect(passenger_client.create_redeemed_promo_code(
               Ioki::Model::Passenger::RedeemedPromoCode.new(
                 code:            'SECRET',
                 promo_code_type: 'promotion'
               )
             ))
        .to be_a Ioki::Model::Passenger::RedeemedPromoCode
    end
  end
end
