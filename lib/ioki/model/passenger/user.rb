# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class User < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :email, on: [:read, :update], type: :object, class_name: 'Email'
        attribute :first_name, on: [:read, :update], type: :string
        attribute :last_name, on: [:read, :update], type: :string
        attribute :phone_number, on: :read, type: :string
        attribute :locale, on: :read, type: :string
        attribute :airship_named_user_id, on: :read, type: :integer
        attribute :allow_marketing, on: :read, type: :boolean
        attribute :analytics_tracking, on: :read, type: :boolean
        attribute :current_terms_accepted, on: :read, type: :boolean
        attribute :display_name, on: :read, type: :string
        attribute :failed_payments, on: :read, type: :boolean
        attribute :logpay_customer_set, on: :read, type: :boolean
        attribute :minimum_age_confirmed, on: :read, type: :boolean
        attribute :referral_code, on: :read, type: :string
        attribute :referring_user_set, on: :read, type: :boolean
        attribute :registered, on: :read, type: :boolean
        attribute :remaining_referrals, on: :read, type: :integer
        attribute :unique_customer_id, on: :read, type: :string
        attribute :version, on: [:read, :update], type: :integer
      end
    end
  end
end
