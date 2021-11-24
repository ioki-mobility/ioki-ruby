# frozen_string_literal: true

require 'ioki/model/platform/payment_method_summary'

module Ioki
  module Model
    module Platform
      class PaymentMethod < Base
        attribute :id, on: :create, type: :string, omit_if_blank_on: :create
        attribute :payment_method_type, on: :create, type: :string
        attribute :attached, on: :read, type: :boolean
        attribute :summary, on: :read, type: :object, model_class: PaymentMethodSummary
      end
    end
  end
end
