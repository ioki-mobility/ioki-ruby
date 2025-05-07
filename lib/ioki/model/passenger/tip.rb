# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Tip < Base
        attribute :paypal_secure_element, type: :string, on: [:create, :read, :update]
        attribute :payment_method, type: :object, on: [:create, :read, :update], class_name: 'PaymentMethodUseSchema'
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :amount, on: :read, type: :object, class_name: 'Money'
        attribute :driver, on: :read, type: :object, class_name: 'Driver'
        attribute :ride, on: :read, type: :object, class_name: 'Ride'
      end
    end
  end
end
