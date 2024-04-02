# frozen_string_literal: true

require 'ioki/model'
require 'ioki/apis/endpoints/endpoints'
require 'ioki/apis/endpoints/passenger/update_language'

module Ioki
  class PassengerApi
    API_BASE_PATH = 'passenger'
    ENDPOINTS = [
      Endpoints.crud_endpoints(
        :ride,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::Ride,
        except:      [:update, :delete]
      ),
      Endpoints::ShowSingular.new(
        :current_ride,
        base_path:   [],
        path:        [API_BASE_PATH, 'rides', 'current'],
        model_class: Ioki::Model::Passenger::Ride
      ),
      Endpoints::ShowSingular.new(
        :bootstrap,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::Bootstrap
      ),
      Endpoints::ShowSingular.new(
        :client,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::Client
      ),
      Endpoints::ShowSingular.new(
        :user,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::User
      ),
      Endpoints::Index.new(
        :products,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::Product
      ),
      Endpoints::Show.new(
        :product,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::Product
      ),
      Endpoints::Create.new(
        :ride_inquiry,
        base_path:   [API_BASE_PATH],
        path:        'ride_inquiry',
        model_class: Ioki::Model::Passenger::RideInquiry
      ),
      Endpoints::Create.new(
        :cancellation,
        base_path:            [API_BASE_PATH, 'rides', :id],
        path:                 'cancellation',
        model_class:          Ioki::Model::Passenger::Ride,
        outgoing_model_class: Ioki::Model::Passenger::Cancellation
      ),
      Endpoints::Create.new(
        :cancellation_voucher,
        base_path:            [API_BASE_PATH, 'rides', :id],
        path:                 'cancellation_voucher',
        model_class:          Ioki::Model::Passenger::CancellationVoucher,
        outgoing_model_class: Ioki::Model::Passenger::CancellationVoucher
      ),
      Endpoints::Create.new(
        :booking,
        base_path:   [API_BASE_PATH, 'rides', :id],
        path:        'booking',
        model_class: Ioki::Model::Passenger::Booking
      ),
      Endpoints::Update.new(
        :user_phone_number,
        base_path:            [API_BASE_PATH, 'user'],
        path:                 'phone_number',
        model_class:          Ioki::Model::Passenger::User,
        outgoing_model_class: Ioki::Model::Passenger::UserPhoneNumber
      ),
      Endpoints::Create.new(
        :user_flags,
        base_path:            [API_BASE_PATH, 'user'],
        path:                 'flags',
        model_class:          Ioki::Model::Passenger::User,
        outgoing_model_class: Ioki::Model::Passenger::UserFlags
      ),
      Endpoints::Create.new(
        :phone_verification_request,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::PhoneVerificationRequest
      ),
      Endpoints::Update.new(
        :user,
        path:        'user',
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::User
      ),
      Endpoints::ShowSingular.new(
        :notification_settings,
        path:        'notification_settings',
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::NotificationSettings
      ),
      Endpoints::ShowSingular.new(
        :default_notification_settings,
        path:        %w[passenger notification_settings defaults],
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::NotificationSettings
      ),
      Endpoints::ShowSingular.new(
        :available_notification_settings,
        path:        %w[passenger notification_settings available],
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::NotificationSettings
      ),
      Endpoints.crud_endpoints(
        :notification_setting,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::NotificationSetting,
        except:      [:index, :show, :create, :delete]
      ),
      Endpoints::Create.new(
        :rating,
        base_path:   [API_BASE_PATH, 'rides', :id],
        path:        'rating',
        model_class: Ioki::Model::Passenger::Rating
      ),
      Endpoints::Create.new(
        :ride_series,
        base_path:   [API_BASE_PATH, 'rides', :id],
        path:        'ride_series',
        model_class: Ioki::Model::Passenger::RideSeries
      ),
      Endpoints.crud_endpoints(
        :station,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::Station,
        only:        [:index, :show]
      ),
      Endpoints::Create.new(
        :logpay_customer,
        base_path:            [API_BASE_PATH],
        path:                 ['logpay', 'customer'],
        model_class:          Ioki::Model::Passenger::LogpayUrl,
        outgoing_model_class: Ioki::Model::Passenger::LogpayCustomer
      ),
      Endpoints::Create.new(
        :logpay_payment_method,
        base_path:            [API_BASE_PATH],
        path:                 ['logpay', 'payment_method'],
        model_class:          Ioki::Model::Passenger::LogpayUrl,
        outgoing_model_class: Ioki::Model::Passenger::LogpayPaymentMethod
      ),
      Endpoints::Create.new(
        :logpay_paypal_client_token,
        base_path:   [API_BASE_PATH],
        path:        ['logpay', 'paypal_client_token'],
        model_class: Ioki::Model::Passenger::LogpayPaypalClientToken
      ),
      Endpoints::Index.new(
        :payment_methods,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::PaymentMethod
      ),
      Endpoints::Create.new(
        :payment_method,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::PaymentMethod
      ),
      Endpoints::Delete.new(
        :payment_method,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::PaymentMethod
      ),
      Endpoints::Index.new(
        :service_credits,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::ServiceCredit
      ),
      Endpoints::Create.new(
        :service_credit,
        base_path:            [API_BASE_PATH],
        model_class:          Ioki::Model::Passenger::ServiceCredit,
        outgoing_model_class: Ioki::Model::Passenger::ServiceCreditCreate
      ),
      Endpoints::Index.new(
        :personal_discounts,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::PersonalDiscount
      ),
      Endpoints::Create.new(
        :personal_discount,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::PersonalDiscount
      ),
      Endpoints::Index.new(
        :personal_discount_types,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::PersonalDiscountType
      ),
      Endpoints::Create.new(
        :tip,
        base_path:            [API_BASE_PATH, 'rides', :id],
        path:                 'tip',
        model_class:          Ioki::Model::Passenger::Tip,
        outgoing_model_class: Ioki::Model::Passenger::TipCreate
      ),
      Endpoints.custom_endpoints(
        :stripe,
        actions:     { 'setup_intent' => :post },
        path:        [API_BASE_PATH, 'payment_methods'],
        model_class: Ioki::Model::Passenger::StripeSetupIntent
      ),
      Endpoints::Passenger::UpdateLanguage.new,
      Endpoints.crud_endpoints(
        :redeemed_promo_code,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::RedeemedPromoCode,
        only:        [:index, :create]
      )
    ].freeze
  end
end
