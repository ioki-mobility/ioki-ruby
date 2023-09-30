# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PaymentMethodDetails < Base
        def self.schema_path
          'passenger_api--v1--payment_method_details_schema'
        end
        attribute :braintree_nonce, on: :create, type: :string
        attribute :paypal_secure_element, on: :create, type: :string
        attribute :stripe_payment_method_id, on: :create, type: :string, omit_if_nil_on: :create
      end
    end
  end
end
