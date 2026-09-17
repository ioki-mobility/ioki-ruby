# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module PaymentServiceProvider
        class Logpay < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :logpay_payment_method_types,
                    on:   :read,
                    type: :array
        end
      end
    end
  end
end
