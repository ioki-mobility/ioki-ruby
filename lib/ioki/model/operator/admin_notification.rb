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
                  on:   :read,
                  type: :string

        attribute :title,
                  on:   :read,
                  type: :string

        attribute :description,
                  on:   :read,
                  type: :string

        attribute :read_at,
                  on:   :read,
                  type: :date_time
      end
    end
  end
end
