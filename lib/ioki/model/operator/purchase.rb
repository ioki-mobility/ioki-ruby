# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Purchase < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :amount,
                  on:         :read,
                  type:       :object,
                  class_name: 'Money'

        attribute :purchase_type,
                  on:   :read,
                  type: :string

        attribute :charge_splits,
                  on:         :read,
                  type:       :array,
                  class_name: 'ChargeSplit'

        attribute :claimable_at,
                  on:   :read,
                  type: :date_time

        attribute :creator_type,
                  on:   :read,
                  type: :string

        attribute :creator_id,
                  on:   :read,
                  type: :string

        attribute :debit_purchase_id,
                  on:   :read,
                  type: :string

        attribute :forfeited_at,
                  on:   :read,
                  type: :date_time

        attribute :gifted_amount,
                  on:         :read,
                  type:       :object,
                  class_name: 'Money'

        attribute :invoices,
                  on:         :read,
                  type:       :array,
                  class_name: 'Invoice'

        attribute :invoice,
                  on:         :read,
                  type:       :object,
                  class_name: 'Invoice'

        attribute :payment_method,
                  on:         :read,
                  type:       :object,
                  class_name: 'PaymentMethod'

        attribute :purchasable_type,
                  on:   :read,
                  type: :string

        attribute :purchasable_id,
                  on:   :read,
                  type: :string

        attribute :ride_id,
                  on:   :read,
                  type: :string

        attribute :reason,
                  on:   :read,
                  type: :string

        attribute :state,
                  on:   :read,
                  type: :string

        attribute :succeeded_at,
                  on:   :read,
                  type: :date_time

        attribute :user_id,
                  on:   :read,
                  type: :string
      end
    end
  end
end
