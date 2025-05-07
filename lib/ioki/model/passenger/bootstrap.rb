# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Bootstrap < Base
        attribute :renewable_ticketing_vouchers, type: :array, on: [:create, :read, :update]
        attribute :product_support_uris, type: :array, on: [:create, :read, :update]
        attribute :failed_purchases, type: :array, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :client, type: :object, on: :read, class_name: 'Client'
        attribute :products, type: :array, on: :read, class_name: 'Product'
        attribute :provider, type: :object, on: :read, class_name: 'Provider'
        attribute :rides_with_failed_payments, type: :array, on: :read, class_name: 'Ride'
        attribute :user, type: :object, on: :read, class_name: 'User'
      end
    end
  end
end
