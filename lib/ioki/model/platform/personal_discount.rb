# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class PersonalDiscount < Base
        attribute :absolute_discount_object, on: :read, type: :object, class_name: 'Money'
        attribute :channel, on: :read, type: :string
        attribute :consumed, on: :read, type: :boolean
        attribute :description, on: :read, type: :string
        attribute :discount_type, on: :read, type: :string
        attribute :maximum_usages, on: :read, type: :integer
        attribute :payment_method, on: :read, type: :object, class_name: 'PaymentMethod'
        attribute :product_id, on: :read, type: :string
        attribute :receipts, on: :read, type: :array, class_name: 'Receipt'
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
