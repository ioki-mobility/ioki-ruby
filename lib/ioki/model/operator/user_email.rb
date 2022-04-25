# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class UserEmail < Base
        unvalidated true

        attribute :confirmed,     on: :read, type: :boolean
        attribute :email_address, on: :read, type: :string
      end
    end
  end
end
