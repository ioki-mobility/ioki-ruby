# frozen_string_literal: true

require 'ioki/model/platform/user_email'

module Ioki
  module Model
    module Platform
      class User < Base
        attribute :email,             type: :object,  on: [:read, :create, :update],
omit_if_blank_on: [:create, :update], model_class: Ioki::Model::Platform::UserEmail
        attribute :external_id,       type: :string,  on: [:read, :create, :update],
omit_if_blank_on: [:create, :update]
        attribute :first_name,        type: :string,  on: [:read, :create, :update],
omit_if_blank_on: [:create, :update]
        attribute :last_name,         type: :string,  on: [:read, :create, :update],
omit_if_blank_on: [:create, :update]
        attribute :lock_reason,       type: :string,  on: :read
        attribute :lock_type,         type: :string,  on: :read
        attribute :locked_at,         type: :string,  on: :read
        attribute :phone_number,      type: :string,  on: [:read, :create, :update],
omit_if_blank_on: [:create, :update]
        attribute :terms_accepted_at, type: :string,  on: :read
        attribute :terms_accepted,    type: :boolean, on: [:create, :update]
        attribute :version,           type: :integer, on: :read
      end
    end
  end
end
