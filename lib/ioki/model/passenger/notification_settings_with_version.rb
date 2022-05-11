# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class NotificationSettingsWithVersion < Base
        attribute :notification_settings, on: [:update], type: :object, class_name: 'NotificationSettings'
        attribute :version, on: [:update], type: :integer
      end
    end
  end
end
