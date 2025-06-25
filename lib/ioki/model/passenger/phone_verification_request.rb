# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PhoneVerificationRequest < Base
        attribute :client_challenge, type: :object, on: [:create, :read, :update], class_name: 'ClientChallenge'
        attribute :captcha, type: :object, on: [:create, :read, :update], class_name: 'Captcha'
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :phone_number, type: :string, on: :create
        attribute :us_data_transfer_accepted, type: :bool, on: :create, unvalidated: true
        # The model does not return it but it's used when sending data to the server.
      end
    end
  end
end
