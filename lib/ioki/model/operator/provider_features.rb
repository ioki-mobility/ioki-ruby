# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ProviderFeatures < Base
        attribute :multiple_booking_solutions,
                  type: :boolean,
                  on:   :read

        attribute :analytics_tracking,
                  type: :boolean,
                  on:   :read

        attribute :marketing_automation,
                  type: :boolean,
                  on:   :read

        attribute :minimum_age_confirmation,
                  type:       :object,
                  class_name: 'MinimumAgeConfirmation',
                  on:         :read

        attribute :newsletter,
                  type: :boolean,
                  on:   :read

        attribute :non_purchasable_personal_discounts,
                  type: :boolean,
                  on:   :read

        attribute :payment,
                  type: :boolean,
                  on:   :read

        attribute :promo_codes,
                  type: :boolean,
                  on:   :read

        attribute :purchasable_personal_discounts,
                  type: :boolean,
                  on:   :read

        attribute :referrals,
                  type:       :object,
                  class_name: 'Referrals',
                  on:         :read

        attribute :service_credits,
                  type: :boolean,
                  on:   :read

        attribute :apply_for_non_purchasable_personal_discounts,
                  type: :boolean,
                  on:   :read

        attribute :receipts,
                  type: :boolean,
                  on:   :read

        attribute :tickets,
                  type: :boolean,
                  on:   :read

        attribute :unique_customer_id,
                  type: :boolean,
                  on:   :read

        attribute :user_email_required,
                  type: :boolean,
                  on:   :read
      end
    end
  end
end
