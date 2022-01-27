# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Admin < Base
        attribute :email, on: :read, type: :string
        attribute :first_name, on: :read, type: :string
        attribute :last_name, on: :read, type: :string
      end
    end
  end
end
