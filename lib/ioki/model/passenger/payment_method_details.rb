# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PaymentMethodDetails < Base
        def self.schema_path
          'passenger_api--payment_method_details_schema'
        end

        attribute :braintree_nonce, on: :create, type: :string, omit_if_nil_on: :create
        attribute :paypal_secure_element, on: :create, type: :string, omit_if_nil_on: :create
        attribute :stripe_payment_method_id, on: :create, type: :string, omit_if_nil_on: :create
      end
    end
  end
end
