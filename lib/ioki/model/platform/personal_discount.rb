# frozen_string_literal: true

require 'ioki/model/platform/money'
require 'ioki/model/platform/payment_method'
require 'ioki/model/platform/receipt'

module Ioki
  module Model
    module Platform
      class PersonalDiscount < Base
        attribute :absolute_discount_object, on: :read, type: :object, model_class: Ioki::Model::Platform::Money
        attribute :channel, on: :read, type: :string
        attribute :consumed, on: :read, type: :boolean
        attribute :description, on: :read, type: :string
        attribute :discount_type, on: :read, type: :string
        attribute :maximum_usages, on: :read, type: :integer
        attribute :payment_method, on: :read, type: :object, model_class: Ioki::Model::Platform::PaymentMethod
        attribute :product_id, on: :read, type: :string
        attribute :receipts, on: :read, type: :array, model_class: Ioki::Model::Platform::Receipt
        attribute :relative_discount, on: :read, type: :integer
        attribute :title, on: :read, type: :string
        attribute :usages, on: :read, type: :integer
        attribute :valid_from, on: :read, type: :date_time
        attribute :valid_until, on: :read, type: :date_time
        attribute :validity, on: :read, type: :string
      end
    end
  end
end
