# frozen_string_literal: true

require 'ioki/model'
require 'ioki/apis/endpoints/endpoints'

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
        :bootstrap,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::Bootstrap
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
      Endpoints::Create.new(
        :rating,
        base_path:   [API_BASE_PATH, 'rides', :id],
        path:        'rating',
        model_class: Ioki::Model::Passenger::Rating
      ),
      Endpoints::Show.new(
        :station,
        base_path:   [API_BASE_PATH],
        model_class: Ioki::Model::Passenger::Station
      ),
      Endpoints::UpdateLanguage.new
    ].freeze
  end
end
