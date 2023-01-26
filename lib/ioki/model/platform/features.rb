# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Features < Base
        unvalidated true # Specification not available

        attribute :failed_payment_handling, type: :boolean, on: :read
        attribute :payment, type: :boolean, on: :read
        attribute :supports_multiple_booking_solutions, type: :boolean, on: :read
      end
    end
  end
end
