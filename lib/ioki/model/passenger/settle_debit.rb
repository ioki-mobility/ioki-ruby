# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class SettleDebit < Base
        attribute :payment_method,
                  on:         :update,
                  type:       :object,
                  class_name: 'PaymentMethod'

        attribute :paypal_secure_element,
                  on:   :update,
                  type: :string
      end
    end
  end
end
