# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class AdminNotificationBatch < Base
        def self.schema_path
          'operator_api--v20210101--admin_notification_bulk_schema'
        end

        attribute :admin_notification_ids,
                  on:   :create,
                  type: :array
      end
    end
  end
end
