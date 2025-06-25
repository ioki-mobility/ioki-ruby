# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class PersonalDiscount < Base
        attribute :fixed_price_per_ride, type: :object, on: [:create, :read, :update], class_name: 'Money'
        attribute :fixed_price_per_passenger, type: :object, on: [:create, :read, :update], class_name: 'Money'
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :channel, type: :string
        attribute :consumed, type: :boolean
        attribute :description, type: :string
        attribute :discount_type, type: :string
        attribute :maximum_usages, type: :integer
        attribute :product_id, type: :string
        attribute :provider_id, type: :string
        attribute :relative_discount, type: :integer
        attribute :title, type: :string
        attribute :usages, type: :integer
        attribute :valid_from, type: :date_time
        attribute :valid_until, type: :date_time
        attribute :validity, type: :string
        attribute :absolute_discount, type: :object, class_name: 'Money'
        attribute :payment_method, type: :object, class_name: 'PaymentMethod'
        attribute :user, type: :object, class_name: 'User'
      end
    end
  end
end
