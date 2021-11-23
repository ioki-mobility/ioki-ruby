# frozen_string_literal: true

require 'ioki/model/platform/user_email'

module Ioki
  module Model
    module Platform
      class UserEmail < Base
        unvalidated true

        attribute :confirmed,     on: :read, type: :boolean
        attribute :email_address, on: :read, type: :string
      end
    end
  end
end
