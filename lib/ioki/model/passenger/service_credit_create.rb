# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class ServiceCreditCreate < Base
        attribute :cost, type: :integer, on: :create
        attribute :value, type: :integer, on: :create
        attribute :payment_method, type: :object, on: :create, class_name: 'PaymentMethod'
        attribute :paypal_secure_element, type: :string, on: :create, omit_if_nil_on: :create
      end
    end
  end
end
