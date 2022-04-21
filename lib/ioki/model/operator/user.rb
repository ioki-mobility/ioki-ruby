# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class User < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :email,             type: :object,  on: [:read, :create, :update],
omit_if_blank_on: [:create, :update], class_name: 'UserEmail'
        attribute :external_id,       type: :string,  on: [:read, :create, :update],
omit_if_blank_on: [:create, :update]
        attribute :first_name,        type: :string,  on: [:read, :create, :update],
omit_if_blank_on: [:create, :update]
        attribute :last_name,         type: :string,  on: [:read, :create, :update],
omit_if_blank_on: [:create, :update]
        attribute :locale,            type: :string,  on: :read
        attribute :lock_reason,       type: :string,  on: :read
        attribute :lock_type,         type: :string,  on: :read
        attribute :locked_at,         type: :date_time, on: :read
        attribute :phone_number,      type: :string, on: [:read, :create, :update],
omit_if_blank_on: [:create, :update]
        attribute :terms_accepted_at, type: :date_time, on: :read
        # The model does not return it but it's used when sending data to the server.
        attribute :terms_accepted,    type: :boolean, on: [:create, :update], unvalidated: true
        attribute :version,           type: :integer, on: [:read, :update]
      end
    end
  end
end
