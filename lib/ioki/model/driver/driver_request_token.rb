# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class DriverRequestToken < Base
        attribute :username, on: :create, type: :string, unvalidated: true # The model does not return it but it's used when sending data to the server.
        attribute :pin, on: :create, type: :string, unvalidated: true # The model does not return it but it's used when sending data to the server.
        attribute :token, on: :read, type: :string
        attribute :driver_id, on: :read, type: :string
      end
    end
  end
end
