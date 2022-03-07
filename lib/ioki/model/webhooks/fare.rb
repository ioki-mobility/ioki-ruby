# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Fare < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :fare_details, type: :object
        attribute :fare_type, type: :string
        attribute :booking_price_object, type: :object, class_name: 'Money'
        attribute :final_price_object, type: :object, class_name: 'Money'
        attribute :personal_discount, type: :object, class_name: 'PersonalDiscount'
      end
    end
  end
end
