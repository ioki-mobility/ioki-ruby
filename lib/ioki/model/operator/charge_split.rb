# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ChargeSplit < Base
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

        attribute :purchase_id,
                  on:   :read,
                  type: :string

        attribute :charge,
                  on:         :read,
                  type:       :object,
                  class_name: 'Charge'
      end
    end
  end
end
