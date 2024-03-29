# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Email < Base
        attribute :type, on: :read, type: :string
        attribute :confirmed, on: :read, type: :boolean
        attribute :email_address, on: [:read, :update], type: :string
        attribute :newsletter, on: :read, type: :boolean
        attribute :receipt, on: :read, type: :boolean
      end
    end
  end
end
