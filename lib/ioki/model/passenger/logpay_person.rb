# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class LogpayPerson < Base
        attribute :gender, on: :create, type: :string
        attribute :forename, on: :create, type: :string
        attribute :surname, on: :create, type: :string
        attribute :birth, on: :create, type: :string
      end
    end
  end
end
