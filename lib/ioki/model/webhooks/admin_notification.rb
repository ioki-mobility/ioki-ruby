# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class AdminNotification < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :admin_notification_type, type: :string
        attribute :title, type: :string
        attribute :description, type: :string
        attribute :read_at, type: :date_time
      end
    end
  end
end
