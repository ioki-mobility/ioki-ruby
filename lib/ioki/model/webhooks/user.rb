# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class User < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :version, type: :integer
        attribute :external_id, type: :string
        attribute :first_name, type: :string
        attribute :last_name, type: :string
        attribute :lock_reason, type: :string
        attribute :locked_at, type: :date_time
        attribute :phone_number, type: :string
        attribute :terms_accepted_at, type: :date_time
        attribute :email, type: :object, class_name: 'Email'
      end
    end
  end
end
