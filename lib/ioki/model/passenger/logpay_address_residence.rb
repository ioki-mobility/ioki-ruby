# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class LogpayAddressResidence < Base
        attribute :to1, on: :create, type: :string
        attribute :street, on: :create, type: :string
        attribute :post_code, on: :create, type: :string
        attribute :place, on: :create, type: :string
        attribute :country, on: :create, type: :string
      end
    end
  end
end
