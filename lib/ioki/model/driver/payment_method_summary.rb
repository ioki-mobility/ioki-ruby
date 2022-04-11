# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class PaymentMethodSummary < Base
        attribute :type, on: :read, type: :string
        attribute :brand, on: :read, type: :string
        attribute :expiration, on: :read, type: :string
        attribute :kind, on: :read, type: :string
        attribute :last4, on: :read, type: :string
        attribute :mandate_url, on: :read, type: :string
        attribute :title, on: :read, type: :string
      end
    end
  end
end