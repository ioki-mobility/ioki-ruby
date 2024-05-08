# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      module Ticketing
        class VoucherRenewalInformation < Base
          attribute :type, on: :read, type: :string
          attribute :renewable, on: :read, type: :boolean
          attribute :valid_from, on: :read, type: :date_time
          attribute :valid_until, on: :read, type: :date_time
        end
      end
    end
  end
end
