# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RideBooking < Base
        attribute :ride_version,
                  on:   :create,
                  type: :integer

        attribute :solution_id,
                  on:   :create,
                  type: :string

        attribute :payment_method,
                  on:    :create,
                  type:  :object,
                  class: Ioki::Model::Operator::PaymentMethod

        attribute :verification_code,
                  on:   :read,
                  type: :string
      end
    end
  end
end
