# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class NotificationSettings < Base
        base 'Array', item_class_name: 'NotificationSetting'
      end
    end
  end
end
