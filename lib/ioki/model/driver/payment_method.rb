# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class PaymentMethod < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :attached, on: :read, type: :boolean
        attribute :payment_method_type, on: :read, type: :string
        attribute :summary, on: :read, type: :object, class_name: 'PaymentMethodSummary'
      end
    end
  end
end
