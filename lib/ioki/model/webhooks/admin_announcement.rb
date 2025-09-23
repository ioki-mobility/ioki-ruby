# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class AdminAnnouncement < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :admin_announcement_type, type: :string
        attribute :author_id, type: :string
        attribute :processed_at, type: :date_time
      end
    end
  end
end
