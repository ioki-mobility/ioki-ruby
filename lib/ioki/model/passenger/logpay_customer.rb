# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class LogpayCustomer < Base
        def self.schema_path
          'passenger_api--logpay_customer_schema'
        end

        attribute :payment_method_type, on: :create, type: :string
        attribute :email, on: :create, type: :string
        attribute :person, on: :create, type: :object, class_name: 'LogpayPerson'
        attribute :address_residence, on: :create, type: :object, class_name: 'LogpayAddressResidence'
      end
    end
  end
end
