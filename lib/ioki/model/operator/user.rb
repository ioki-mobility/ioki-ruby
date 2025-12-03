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

        attribute :product_id,
                  on:   :create,
                  type: :string

        attribute :user_segment_id,
                  on:   :create,
                  type: :string

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
                  on:   [:read, :create],
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

        attribute :terms_accepted,
                  on:   :create,
                  type: :boolean

        attribute :terms_accepted_at,
                  on:   :read,
                  type: :date_time

        attribute :minimum_age_confirmed,
                  on:   :create,
                  type: :boolean

        attribute :analytics_tracking,
                  on:   :create,
                  type: :boolean

        attribute :unique_customer_id,
                  on:   :read,
                  type: :string

        attribute :version,
                  on:             [:read, :update],
                  omit_if_nil_on: [:update],
                  type:           :integer

        attribute :last_activity_at,
                  on:   :read,
                  type: :date_time

        attribute :user_segment,
                  on:         :read,
                  type:       :object,
                  class_name: 'UserSegment'

        attribute :payment_methods,
                  on:         :read,
                  type:       :array,
                  class_name: 'PaymentMethod'
      end
    end
  end
end
