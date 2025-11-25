# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class AdminNotificationBulk < Base
        attribute :admin_notification_ids,
                  on:   :create,
                  type: :array
      end
    end
  end
end
