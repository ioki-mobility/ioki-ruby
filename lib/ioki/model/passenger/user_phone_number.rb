# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class UserPhoneNumber < Base
        unvalidated true # Specification not available. Only used for updating a user's phone number.

        attribute :id, on: :read, type: :string
        attribute :phone_number, on: :update, type: :string
        attribute :code, on: :update, type: :string
      end
    end
  end
end
