# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Broadcast < Base
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

        attribute :body,
                  on:   [:create, :read],
                  type: :string

        attribute :admin_name,
                  on:   :read,
                  type: :string
      end
    end
  end
end
