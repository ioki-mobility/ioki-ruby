# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class UserEmail < Base
        attribute :confirmed,     type: :boolean, on: :read
        attribute :email_address, type: :string, on: [:read, :update]
      end
    end
  end
end
