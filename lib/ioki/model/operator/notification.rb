# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Notification < Base
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
                  on:   :read,
                  type: :string

        attribute :body_for_sms,
                  on:   :read,
                  type: :string

        attribute :channels,
                  on:   :read,
                  type: :array

        attribute :delivered_at,
                  on:   :read,
                  type: :date_time

        attribute :notification_type,
                  on:   :read,
                  type: :string
      end
    end
  end
end
