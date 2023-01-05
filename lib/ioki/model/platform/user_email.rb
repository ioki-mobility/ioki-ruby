# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class UserEmail < Base
        unvalidated true

        attribute :confirmed,
                  on:   :read,
                  type: :boolean

        attribute :confirmed_email_address,
                  on:   [:create, :update],
                  type: :string

        attribute :email_address,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :newsletter,
                  on:   [:create, :read, :update],
                  type: :boolean

        attribute :receipt,
                  on:   [:create, :read, :update],
                  type: :boolean

        attribute :unconfirmed_email_address,
                  on:   [:create, :update],
                  type: :string
      end
    end
  end
end
