# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class NotificationSetting < Base
        def self.schema_path
          'passenger_api--v1--notification_setting'
        end

        attribute :id, on: :read, type: :string
        attribute :type, on: :read, type: :string
        attribute :name, on: [:read, :update], type: :string
        attribute :channels, on: [:read, :update], type: :array
      end
    end
  end
end
