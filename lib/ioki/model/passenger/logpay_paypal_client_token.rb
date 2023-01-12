# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class LogpayPaypalClientToken < Base
        attribute :client_token, on: :read, type: :string
      end
    end
  end
end
