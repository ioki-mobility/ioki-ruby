# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class LogpayUrl < Base
        def self.schema_path
          'passenger_api--v1--logpay_payment_method_setup_url'
        end

        attribute :url, on: :create, type: :string
      end
    end
  end
end
