# frozen_string_literal: true

require 'ioki/model/platform/money'

module Ioki
  module Model
    module Platform
      class ServiceCreditCharge < Base
        attribute :amount, on: :read, type: :object, model_class: Ioki::Model::Platform::Money
        attribute :purchasable, on: :read, type: :object  # The model_class is omitted because it can have one of several types.
        attribute :state, on: :read, type: :string
      end
    end
  end
end
