# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class ServiceCreditCreate < Base
        attribute :cost, type: :integer, on: :create
        attribute :value, type: :integer, on: :create
        attribute :payment_method, type: :object, on: :create, class_name: 'PaymentMethod'
      end
    end
  end
end
