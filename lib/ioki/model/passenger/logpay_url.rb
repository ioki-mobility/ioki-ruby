# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class LogpayUrl < Base
        attribute :url, on: :create, type: :string
      end
    end
  end
end
