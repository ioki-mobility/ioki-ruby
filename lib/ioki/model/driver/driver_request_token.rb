# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class DriverRequestToken < Base
        # The model does not return them but they're used when sending data to the server:
        attribute :username, on: :create, type: :string, unvalidated: true
        attribute :pin, on: :create, type: :string, unvalidated: true
        attribute :password, on: :create, type: :string, unvalidated: true
        attribute :product_login_slug, on: :create, type: :string, unvalidated: true
        # This is what we care about:
        attribute :token, on: :read, type: :string
        attribute :driver_id, on: :read, type: :string
        # This is not so interesting:
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
      end
    end
  end
end
