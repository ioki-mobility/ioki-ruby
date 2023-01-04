# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class PhoneVerificationRequest < Base
        def self.schema_path
          'platform_api--v20210101--external_phone_verification_request'
        end

        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :phone_number, on: [:read, :create], type: :string
        attribute :locale, on: [:create], type: :string, unvalidated: true
        attribute :captcha, type: :object, on: :read, class_name: 'Captcha'
        attribute :client_challenge, type: :object, on: :read, class_name: 'ClientChallenge'
      end
    end
  end
end
