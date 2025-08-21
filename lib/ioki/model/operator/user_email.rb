# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class UserEmail < Base
        unvalidated true

        attribute :confirmed,     on: :read, type: :boolean
        attribute :email_address, on: [:read, :create], type: :string
        attribute :newsletter,    on: [:read, :create], type: :boolean
        attribute :receipt,       on: [:read, :create], type: :boolean
      end
    end
  end
end
