# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ProviderFeatures < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :analytics_tracking,
                  on:   :read,
                  type: :boolean

        attribute :marketing_automation,
                  on:   :read,
                  type: :boolean

        attribute :minimum_age_confirmation,
                  on:         :read,
                  type:       :object,
                  class_name: 'Ioki::Model::Operator::MinimumAgeConfirmation'

        attribute :newsletter,
                  on:   :read,
                  type: :boolean

        attribute :non_purchasable_personal_discounts,
                  on:   :read,
                  type: :boolean

        attribute :payment,
                  on:   :read,
                  type: :boolean

        attribute :promo_codes,
                  on:   :read,
                  type: :boolean

        attribute :purchasable_personal_discounts,
                  on:   :read,
                  type: :boolean

        attribute :referrals,
                  on:         :read,
                  type:       :object,
                  class_name: 'Ioki::Model::Operator::Referrals'

        attribute :service_credits,
                  on:   :read,
                  type: :boolean

        attribute :apply_for_non_purchasable_personal_discounts,
                  on:   :read,
                  type: :boolean

        attribute :receipts,
                  on:   :read,
                  type: :boolean

        attribute :tickets,
                  on:   :read,
                  type: :boolean

        attribute :unique_customer_id,
                  on:   :read,
                  type: :boolean

        attribute :user_email_required,
                  on:   :read,
                  type: :boolean
      end
    end
  end
end
