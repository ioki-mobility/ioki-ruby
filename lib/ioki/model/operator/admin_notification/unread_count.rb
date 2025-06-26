# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module AdminNotification
        class UnreadCount < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :unread_count,
                    on:   :read,
                    type: :integer
        end
      end
    end
  end
end
