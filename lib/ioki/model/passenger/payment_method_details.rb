# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PaymentMethodDetails < Base
        attribute :braintree_nonce, on: :create, type: :string
        attribute :paypal_secure_element, on: :create, type: :string
      end
    end
  end
end
