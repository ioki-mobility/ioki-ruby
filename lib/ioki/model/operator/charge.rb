# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Charge < Base
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

        attribute :charge_type,
                  on:   :read,
                  type: :string

        attribute :payment_charge_id,
                  on:   :read,
                  type: :string

        attribute :payment_method,
                  on:         :read,
                  type:       :object,
                  class_name: 'PaymentMethod'

        attribute :purchase_ids,
                  on:   :read,
                  type: :array

        attribute :receipt,
                  on:         :read,
                  type:       :object,
                  class_name: 'Receipt'

        attribute :reservation,
                  on:   :read,
                  type: :boolean

        attribute :state,
                  on:   :read,
                  type: :string

        attribute :user_id,
                  on:   :read,
                  type: :string
      end
    end
  end
end
