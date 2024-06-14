# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class NotificationSettings < Base
        unvalidated true

        base 'Array', item_class_name: 'NotificationSetting'
      end
    end
  end
end
