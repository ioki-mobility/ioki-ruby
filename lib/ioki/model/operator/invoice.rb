# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Invoice < Base
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

        attribute :attachment_url,
                  on:   :read,
                  type: :string

        attribute :user_id,
                  on:   :read,
                  type: :string

        attribute :purchase_id,
                  on:   :read,
                  type: :string
      end
    end
  end
end
