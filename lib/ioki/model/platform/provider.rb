# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Provider < Base
        attribute :custom_urls, type: :array, on: [:create, :read, :update]
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :version,
                  on:   :read,
                  type: :integer

        attribute :city,
                  on:   :read,
                  type: :string

        attribute :country_code,
                  on:   :read,
                  type: :string

        attribute :currency,
                  on:   :read,
                  type: :string

        attribute :current_tos_date,
                  on:   :read,
                  type: :date_time

        attribute :help_url,
                  on:   :read,
                  type: :string

        attribute :imprint_url,
                  on:   :read,
                  type: :string

        attribute :imprint,
                  on:   :read,
                  type: :string

        attribute :logpay_payment_method_types,
                  on:   :read,
                  type: :array

        attribute :merchant_name,
                  on:   :read,
                  type: :string

        attribute :name,
                  on:   :read,
                  type: :string

        deprecated_attribute :other_url,
                             on:   :read,
                             type: :string

        attribute :personal_discount_payment_method_types,
                  on:   :read,
                  type: :array

        attribute :postal_code,
                  on:   :read,
                  type: :string

        attribute :privacy_policy_url,
                  on:   :read,
                  type: :string

        attribute :psp,
                  on:   :read,
                  type: :string

        attribute :ride_payment_method_types,
                  on:   :read,
                  type: :array

        attribute :service_credit_payment_method_types,
                  on:   :read,
                  type: :array

        attribute :street_name,
                  on:   :read,
                  type: :string

        attribute :street_number,
                  on:   :read,
                  type: :string

        attribute :stripe_account_id,
                  on:   :read,
                  type: :string

        attribute :stripe_payment_method_types,
                  on:   :read,
                  type: :array

        attribute :stripe_publishable_key,
                  on:   :read,
                  type: :string

        attribute :support_email,
                  on:   :read,
                  type: :string

        attribute :support_phone_number,
                  on:   :read,
                  type: :string

        attribute :support_website_url,
                  on:   :read,
                  type: :string

        attribute :terms_of_service_url,
                  on:   :read,
                  type: :string

        attribute :tip_payment_method_types,
                  on:   :read,
                  type: :array

        attribute :ticketing_payment_method_types,
                  on:   :read,
                  type: :array

        attribute :default_operator,
                  on:         :read,
                  type:       :object,
                  class_name: 'Operator'

        attribute :features,
                  on:         :read,
                  type:       :object,
                  class_name: 'ProviderFeatures'

        attribute :operators,
                  on:         :read,
                  type:       :array,
                  class_name: 'Operator'

        attribute :service_credit_options,
                  on:         :read,
                  type:       :object,
                  class_name: 'ServiceCreditOptions'
      end
    end
  end
end
