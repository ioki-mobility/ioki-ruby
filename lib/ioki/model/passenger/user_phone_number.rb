# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class UserPhoneNumber < Base
        attribute :phone_number, type: :string, on: :update
        attribute :code, type: :string, on: :update
      end
    end
  end
end
