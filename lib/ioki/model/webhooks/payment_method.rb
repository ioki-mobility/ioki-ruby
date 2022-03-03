# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class PaymentMethod < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :payment_method_type, type: :string
      end
    end
  end
end
