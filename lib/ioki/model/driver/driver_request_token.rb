# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class DriverRequestToken < Base
        attribute :username, on: :create, type: :string
        attribute :pin, on: :create, type: :string
        attribute :token, on: :read, type: :string
      end
    end
  end
end
