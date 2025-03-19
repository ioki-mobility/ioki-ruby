# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class DriverMulticast < Base
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

        attribute :driver_ids,
                  on:   :create,
                  type: :array

        attribute :receivers_count,
                  on:   :read,
                  type: :integer

        attribute :sender_id,
                  on:   :read,
                  type: :string

        attribute :sender_name,
                  on:   :read,
                  type: :string

        attribute :sender_type,
                  on:   :read,
                  type: :string

        attribute :processed_at,
                  type: :date_time,
                  on:   :read
      end
    end
  end
end
