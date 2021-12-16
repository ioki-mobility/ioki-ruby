# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class PaymentMethodSummary < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at and :id.
        def self.specification_scope
          'platform_api--v20210101'
        end

        attribute :type, on: :read, type: :string
        attribute :brand, on: :read, type: :string
        attribute :expiration, on: :read, type: :date_time
        attribute :kind, on: :read, type: :string
        attribute :last4, on: :read, type: :string
        attribute :mandate_url, on: :read, type: :string
        attribute :title, on: :read, type: :string
      end
    end
  end
end
