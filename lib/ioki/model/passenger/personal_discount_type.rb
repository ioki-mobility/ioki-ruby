# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PersonalDiscountType < Base
        attribute :absolute_discount_object, on: :read, type: :object, class_name: 'Money'
        attribute :default_duration, on: :read, type: :integer
        attribute :description, on: :read, type: :string
        attribute :discount_type, on: :read, type: :string
        attribute :price_object, on: :read, type: :object, class_name: 'Money'
        attribute :product_id, on: :read, type: :string
        attribute :purchasable, on: :read, type: :boolean
        attribute :relative_discount, on: :read, type: :integer
        attribute :title, on: :read, type: :string
        attribute :validity, on: :read, type: :string
      end
    end
  end
end
