# frozen_string_literal: true

require 'ioki/model/platform/money'
require 'ioki/model/platform/personal_discount'

module Ioki
  module Model
    module Platform
      class Fare < Base
        attribute :booking_price_object, on: :read, type: :object, model_class: Ioki::Model::Platform::Money
        attribute :booking_price_type, on: :read, type: :string
        attribute :fare_details, on: :read, type: :object # The model_class is omitted because the API defines this as a generic JSON object.
        attribute :fare_type, on: :read, type: :string
        attribute :final_price_object, on: :read, type: :object, model_class: Ioki::Model::Platform::Money
        attribute :personal_discount, on: :read, type: :object, model_class: Ioki::Model::Platform::PersonalDiscount
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
