# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      module PaymentServiceProvider
        class Logpay < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :logpay_payment_method_types,
                    on:   :read,
                    type: :array

          attribute :use_legacy_paypal_flow,
                    on:   :read,
                    type: :boolean
        end
      end
    end
  end
end
