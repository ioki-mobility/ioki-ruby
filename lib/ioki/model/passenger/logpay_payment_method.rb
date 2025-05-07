# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class LogpayPaymentMethod < Base
        attribute :payment_method_type, on: :create, type: :string
      end
    end
  end
end
