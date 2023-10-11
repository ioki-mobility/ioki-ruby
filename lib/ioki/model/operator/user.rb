# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class User < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :email,
                  on:               [:read, :create, :update],
                  omit_if_blank_on: [:create, :update],
                  type:             :object,
                  class_name:       'UserEmail'

        attribute :external_id,
                  on:               [:read, :create, :update],
                  omit_if_blank_on: [:create, :update],
                  type:             :string

        attribute :first_name,
                  on:               [:read, :create, :update],
                  omit_if_blank_on: [:create, :update],
                  type:             :string

        attribute :full_name,
                  on:   :read,
                  type: :string

        attribute :last_name,
                  on:               [:read, :create, :update],
                  omit_if_blank_on: [:create, :update],
                  type:             :string

        attribute :locale,
                  on:   :read,
                  type: :string

        attribute :lock_reason,
                  on:   :read,
                  type: :string

        attribute :lock_type,
                  on:   :read,
                  type: :string

        attribute :locked,
                  on:   :read,
                  type: :boolean

        attribute :locked_at,
                  on:   :read,
                  type: :date_time

        attribute :notification_settings,
                  on:         :read,
                  type:       :array,
                  class_name: 'NotificationSetting'

        attribute :phone_number,
                  on:               [:read, :create, :update],
                  omit_if_blank_on: [:create, :update],
                  type:             :string

        attribute :terms_accepted_at,
                  on:   :read,
                  type: :date_time

        attribute :unique_customer_id,
                  on:   :read,
                  type: :string

        attribute :version,
                  on:             [:read, :update],
                  omit_if_nil_on: [:update],
                  type:           :integer
      end
    end
  end
end
