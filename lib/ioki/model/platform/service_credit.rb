# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class ServiceCredit < Base
        attribute :admin, on: :read, type: :object, class_name: 'Admin'
        attribute :balance, on: :read, type: :object, class_name: 'Money'
        attribute :channel, on: :read, type: :string
        attribute :charges, on: :read, type: :array, class_name: 'ServiceCreditCharge'
        attribute :consumed, on: :read, type: :boolean
        attribute :cost, on: :read, type: :object, class_name: 'Money'
        attribute :payment_method, on: :read, type: :object, class_name: 'PaymentMethod'
        attribute :value, on: :read, type: :object, class_name: 'Money'
      end
    end
  end
end
