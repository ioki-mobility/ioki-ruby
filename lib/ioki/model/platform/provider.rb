# frozen_string_literal: true

require 'ioki/model/platform/service_credit_options'

module Ioki
  module Model
    module Platform
      class Provider < Base
        attribute :city, on: :read, type: :string
        attribute :name, on: :read, type: :string
        attribute :country_code, on: :read, type: :string
        attribute :currency, on: :read, type: :string
        attribute :current_tos_date, on: :read, type: :date_time
        attribute :logpay_payment_method_types, on: :read, type: :array
        attribute :merchant_name, on: :read, type: :string
        attribute :personal_discount_payment_method_types, on: :read, type: :array
        attribute :postal_code, on: :read, type: :string
        attribute :psp, on: :read, type: :string
        attribute :ride_payment_method_types, on: :read, type: :array
        attribute :service_credit_options, on: :read, type: :object, model_class: Ioki::Model::Platform::ServiceCreditOptions
        attribute :service_credit_payment_method_types, on: :read, type: :array
        attribute :street_name, on: :read, type: :string
        attribute :street_number, on: :read, type: :string
        attribute :stripe_payment_method_types, on: :read, type: :array
        attribute :tip_payment_method_types, on: :read, type: :array
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
