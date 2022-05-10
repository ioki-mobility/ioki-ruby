# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class NotificationSettings < Base
        attribute :type, on: :read, type: :string
        attribute :ride_notifications, on: [:read, :update], type: :array
        attribute :booking_notifications, on: [:read, :update], type: :array
        attribute :booking_by_operator_notifications, on: [:read, :update], type: :array
        attribute :payment_notifications, on: [:read, :update], type: :array
        attribute :referral_notifications, on: [:read, :update], type: :array
      end
    end
  end
end
