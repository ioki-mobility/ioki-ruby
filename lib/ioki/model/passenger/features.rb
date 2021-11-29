# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Features < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :id, :type, :created_at and :updated_at.

        unvalidated true # Specification not available

        attribute :analytics_tracking, type: :boolean, on: :read
        attribute :failed_payment_handling, type: :boolean, on: :read
        attribute :marketing_automation, type: :boolean, on: :read
        attribute :minimum_age_confirmation, type: :boolean, on: :read
        attribute :newsletter, type: :boolean, on: :read
        attribute :non_purchasable_personal_discounts, type: :boolean, on: :read
        attribute :payment, type: :boolean, on: :read
        attribute :promo_codes, type: :boolean, on: :read
        attribute :purchasable_personal_discounts, type: :boolean, on: :read
        attribute :referrals, type: :boolean, on: :read
        attribute :service_credits, type: :boolean, on: :read
        attribute :unique_customer_id, type: :boolean, on: :read
        attribute :user_email_required, type: :boolean, on: :read
      end
    end
  end
end
