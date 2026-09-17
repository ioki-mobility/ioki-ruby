# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module PaymentServiceProvider
        class Stripe < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :google_pay_supported,
                    on:   :read,
                    type: :boolean

          attribute :stripe_account_id,
                    on:   :read,
                    type: :string

          attribute :stripe_payment_method_types,
                    on:   :read,
                    type: :array
        end
      end
    end
  end
end
