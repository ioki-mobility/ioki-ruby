# frozen_string_literal: true

require 'ioki/model/passenger/money'
require 'ioki/model/passenger/personal_discount'

module Ioki
  module Model
    module Passenger
      class Fare < Base
        attribute :booking_price_object, on: :read, type: :object, model_class: Money
        attribute :booking_price_type, on: :read, type: :string
        attribute :final_price_object, on: :read, type: :object, model_class: Money
        attribute :personal_discount, on: :read, type: :object, model_class: PersonalDiscount
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
