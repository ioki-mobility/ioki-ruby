# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Bootstrap < Base
        attribute :client, type: :object, on: :read, class_name: 'Client'
        attribute :products, type: :array, on: :read, class_name: 'Product'
        attribute :provider, type: :object, on: :read, class_name: 'Provider'
        attribute :rides_with_failed_payments, type: :array, on: :read, class_name: 'Ride'
        attribute :user, type: :object, on: :read, class_name: 'User'
      end
    end
  end
end
