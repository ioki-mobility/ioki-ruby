# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class AdminNotification < Base
        attribute :id,
                  on:   :read,
                  type: :string

        attribute :type,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :admin_notification_type,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :title,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :description,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :read_at,
                  on:   [:create, :read, :update],
                  type: :date_time

        attribute :receiver_id,
                  on:   [:create, :read, :update],
                  type: :string
      end
    end
  end
end
