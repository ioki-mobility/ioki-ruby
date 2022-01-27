# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Fare < Base
        attribute :booking_price_object, on: :read, type: :object, class_name: 'Money'
        attribute :booking_price_type, on: :read, type: :string
        # The model_class is omitted because the API defines this as a generic JSON object.
        attribute :fare_details, on: :read, type: :object
        attribute :fare_type, on: :read, type: :string
        attribute :final_price_object, on: :read, type: :object, class_name: 'Money'
        attribute :personal_discount, on: :read, type: :object, class_name: 'PersonalDiscount'
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
