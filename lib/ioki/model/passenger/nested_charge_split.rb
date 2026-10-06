# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class NestedChargeSplit < Base
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
                  class_name: 'NestedCharge'
      end
    end
  end
end
