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
                  on:                      [:create, :update],
                  type:                    :string,
                  omit_if_not_provided_on: [:create, :update]

        attribute :email_address,
                  on:                      [:create, :read, :update],
                  type:                    :string,
                  omit_if_not_provided_on: [:create, :update]

        attribute :newsletter,
                  on:                      [:create, :read, :update],
                  omit_if_not_provided_on: [:create, :update],
                  type:                    :boolean

        attribute :receipt,
                  on:                      [:create, :read, :update],
                  omit_if_not_provided_on: [:create, :update],
                  type:                    :boolean

        attribute :unconfirmed_email_address,
                  on:                      [:create, :update],
                  type:                    :string,
                  omit_if_not_provided_on: [:create, :update]
      end
    end
  end
end
