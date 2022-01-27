# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ServiceCreditCharge < Base
        attribute :amount, on: :read, type: :object, class_name: 'Money'
        # The model_class is omitted because it can have one of several types.
        attribute :purchasable, on: :read, type: :object
        attribute :state, on: :read, type: :string
      end
    end
  end
end
