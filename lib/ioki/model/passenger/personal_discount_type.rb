# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PersonalDiscountType < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :default_duration, on: :read, type: :integer
        attribute :description, on: :read, type: :string
        attribute :discount_type, on: :read, type: :string
        attribute :fixed_end_date, on: :read, type: :date_time
        attribute :fixed_start_date, on: :read, type: :date_time
        attribute :product_id, on: :read, type: :string
        attribute :purchasable, on: :read, type: :boolean
        attribute :relative_discount, on: :read, type: :integer
        attribute :time_validity_mode, on: :read, type: :string
        attribute :title, on: :read, type: :string
        attribute :validity, on: :read, type: :string
        attribute :absolute_discount, on: :read, type: :object, class_name: 'Money'
        attribute :fixed_price_per_passenger, on: :read, type: :object, class_name: 'Money'
        attribute :fixed_price_per_ride, on: :read, type: :object, class_name: 'Money'
        attribute :price, on: :read, type: :object, class_name: 'Money'

        attribute :personal_discount_type_id, on: :create, type: :integer
        attribute :payment_method, on: :create, type: :object, class_name: 'PaymentMethod'
        attribute :paypal_secure_element, on: :create, type: :string, omit_if_blank: true

        deprecated_attribute :absolute_discount_object, on: :read, type: :object, class_name: 'Money'
        deprecated_attribute :price_object, on: :read, type: :object, class_name: 'Money'
      end
    end
  end
end
