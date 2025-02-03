# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Admin < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :email,
                  on:   :read,
                  type: :string

        attribute :first_name,
                  on:   :read,
                  type: :string

        attribute :last_name,
                  on:   :read,
                  type: :string

        attribute :locale,
                  on:   :read,
                  type: :string

        attribute :super,
                  on:   :read,
                  type: :boolean
      end
    end
  end
end
