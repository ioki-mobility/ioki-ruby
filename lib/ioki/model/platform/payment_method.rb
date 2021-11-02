# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class PaymentMethod < Base
        attribute :id, type: :string, on: :create, omit_if_blank_on: :create
        attribute :payment_method_type, type: :string, on: :create
      end
    end
  end
end
