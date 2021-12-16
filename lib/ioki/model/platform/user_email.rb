# frozen_string_literal: true

require 'ioki/model/platform/user_email'

module Ioki
  module Model
    module Platform
      class UserEmail < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :type, :id, :created_at and
        # :updated_at.

        unvalidated true

        attribute :confirmed,     on: :read, type: :boolean
        attribute :email_address, on: :read, type: :string
      end
    end
  end
end
