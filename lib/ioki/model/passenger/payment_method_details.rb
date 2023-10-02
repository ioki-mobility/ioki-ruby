# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PaymentMethodDetails < Base
        def self.schema_path
          'passenger_api--payment_method_details_schema'
        end

        attribute :braintree_nonce, on: :create, type: :string
        attribute :paypal_secure_element, on: :create, type: :string
      end
    end
  end
end
