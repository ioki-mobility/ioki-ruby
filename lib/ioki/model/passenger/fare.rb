# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Fare < Base
        attribute :line_items, type: :array, on: [:create, :read, :update]
        attribute :custom_message_for_external_pricing, type: :string, on: [:create, :read, :update]
        attribute :fare_type, type: :string, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :booking_price, on: :read, type: :object, class_name: 'Money'
        deprecated_attribute :booking_price_object, on: :read, type: :object, class_name: 'Money'
        attribute :booking_price_type, on: :read, type: :string
        attribute :final_price, on: :read, type: :object, class_name: 'Money'
        deprecated_attribute :final_price_object, on: :read, type: :object, class_name: 'Money'
        attribute :personal_discount, on: :read, type: :object, class_name: 'PersonalDiscount'
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
