# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class ReserveDebit < Base
        attribute :paypal_secure_element,
                  on:   :update,
                  type: :string
      end
    end
  end
end
