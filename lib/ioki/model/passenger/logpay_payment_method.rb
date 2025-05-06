# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class LogpayPaymentMethod < Base
        def self.schema_path
          'passenger_api--logpay_payment_method_schema'
        end

        attribute :payment_method_type, on: :create, type: :string
      end
    end
  end
end
