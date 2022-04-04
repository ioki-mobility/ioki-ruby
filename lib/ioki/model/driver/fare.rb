# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Fare < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :version, on: :read, type: :integer
        attribute :booking_price_type, on: :read, type: :string
        attribute :booking_price, on: :read, type: :object, class_name: 'Money'
        attribute :final_price, on: :read, type: :object, class_name: 'Money'
        attribute :personal_discount, on: :read, type: :object, class_name: 'PersonalDiscount'
      end
    end
  end
end
