# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class MobileTicketData < Base
        unvalidated true # Specification not available.

        attribute :purchase_id, on: :read, type: :string
        attribute :customer_code, on: :read, type: :string
      end
    end
  end
end
