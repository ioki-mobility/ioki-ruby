# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class ServiceCredit < Base
        attribute :paypal_secure_element, type: :string, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :balance, type: :object, on: :read, class_name: 'Money'
        attribute :cost, type: :object, on: :read, class_name: 'Money'
        attribute :payment_method, type: :object, on: :read, class_name: 'PaymentMethod'
        deprecated_attribute :receipts, type: :array, on: :read, class_name: 'Receipt'
        attribute :value, type: :object, on: :read, class_name: 'Money'
      end
    end
  end
end
