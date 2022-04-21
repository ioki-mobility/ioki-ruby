# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Fare < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :booking_price_object, on: :read, type: :object, class_name: 'Money'
        attribute :booking_price_type, on: :read, type: :string
        attribute :final_price_object, on: :read, type: :object, class_name: 'Money'
        attribute :personal_discount, on: :read, type: :object, class_name: 'PersonalDiscount'
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
