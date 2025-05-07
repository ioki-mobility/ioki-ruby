# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class User < Base
        attribute :additional_data, type: :object, on: [:create, :read, :update], class_name: 'AdditionalDataSchema'
        attribute :notification_settings, type: :array, on: [:create, :read, :update]
        attribute :last_activity_at, type: :string, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :analytics_tracking, on: [:read, :create], type: :boolean
        attribute :email,
                  type:             :object,
                  on:               [:read, :create, :update],
                  omit_if_blank_on: [:create, :update],
                  class_name:       'UserEmail'
        attribute :external_id, type: :string, on: [:read, :create, :update], omit_if_blank_on: [:create, :update]
        attribute :first_name, type: :string, on: [:read, :create, :update], omit_if_blank_on: [:create, :update]
        attribute :last_name, type: :string, on: [:read, :create, :update], omit_if_blank_on: [:create, :update]
        attribute :locale, type: :string, on: [:read, :create]
        attribute :lock_reason, type: :string, on: :read
        attribute :lock_type, type: :string, on: :read
        attribute :locked_at, type: :date_time, on: :read
        attribute :minimum_age_confirmed, on: [:read, :create], type: :boolean
        attribute :phone_number, type: :string, on: [:read, :create, :update], omit_if_blank_on: [:create, :update]
        attribute :provider_id, type: :string, on: :read
        attribute :terms_accepted, type: :boolean, on: [:create, :update], unvalidated: true
        attribute :terms_accepted_at, type: :date_time, on: :read
        # attribute :logpay_customer_set, on: :read, type: :boolean
        attribute :version, type: :integer, on: [:read, :update]
      end
    end
  end
end
