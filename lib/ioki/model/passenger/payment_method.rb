# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PaymentMethod < Base
        attribute :id, on: :create, type: :string, omit_if_blank_on: :create
        attribute :payment_method_type, on: :create, type: :string
        attribute :attached, on: :read, type: :boolean
        attribute :summary, on: :read, type: :object, class_name: 'PaymentMethodSummary'
      end
    end
  end
end
