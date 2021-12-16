# frozen_string_literal: true

require 'ioki/model/platform/admin'
require 'ioki/model/platform/money'
require 'ioki/model/platform/service_credit_charge'
require 'ioki/model/platform/money'
require 'ioki/model/platform/payment_method'
require 'ioki/model/platform/money'

module Ioki
  module Model
    module Platform
      class ServiceCredit < Base
        attribute :admin, on: :read, type: :object, model_class: Admin
        attribute :balance, on: :read, type: :object, model_class: Money
        attribute :channel, on: :read, type: :string
        attribute :charges, on: :read, type: :object, model_class: ServiceCreditCharge
        attribute :consumed, on: :read, type: :boolean
        attribute :cost, on: :read, type: :object, model_class: Money
        attribute :payment_method, on: :read, type: :object, model_class: PaymentMethod
        attribute :value, on: :read, type: :object, model_class: Money
      end
    end
  end
end
