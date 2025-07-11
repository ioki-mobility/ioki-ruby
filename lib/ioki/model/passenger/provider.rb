# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Provider < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :avatar, on: :read, type: :object, class_name: 'ImageUpload'
        attribute :avatar_darkmode, on: :read, type: :object, class_name: 'ImageUpload'
        attribute :city, on: :read, type: :string
        attribute :country_code, on: :read, type: :string
        attribute :currency, on: :read, type: :string
        attribute :current_tos_date, on: :read, type: :date_time
        attribute :features, on: :read, type: :object, class_name: 'Features'
        attribute :logpay_payment_method_types, on: :read, type: :array
        attribute :merchant_name, on: :read, type: :string
        attribute :name, on: :read, type: :string
        attribute :personal_discount_payment_method_types, on: :read, type: :array
        attribute :postal_code, on: :read, type: :string
        attribute :psp, on: :read, type: :string
        attribute :retry_payment_method_types, on: :read, type: :array
        attribute :ride_payment_method_types, on: :read, type: :array
        attribute :service_credit_options, on: :read, type: :object, class_name: 'ServiceCreditOptions'
        attribute :service_credit_payment_method_types, on: :read, type: :array
        attribute :street_name, on: :read, type: :string
        attribute :street_number, on: :read, type: :string
        attribute :stripe_account_id, on: :read, type: :string
        attribute :stripe_payment_method_types, on: :read, type: :array
        attribute :tip_payment_method_types, on: :read, type: :array
        attribute :ticketing_payment_method_types, on: :read, type: :array
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
