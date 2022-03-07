# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class UserEmail < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :type, :id, :created_at and
        # :updated_at.

        unvalidated true

        attribute :confirmed,     on: :read, type: :boolean
        attribute :email_address, on: [:create, :read, :update], type: :string
        attribute :newsletter,    on: [:create, :read, :update], type: :boolean
        attribute :receipt,       on: [:create, :read, :update], type: :boolean
      end
    end
  end
end
