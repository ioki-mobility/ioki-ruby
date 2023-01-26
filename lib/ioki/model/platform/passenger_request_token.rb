# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class PassengerRequestToken < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :client_identifier, type: :string, on: :create, unvalidated: true
        attribute :token, type: :string, on: :read
        attribute :user,  type: :object, on: :read, class_name: 'User', unvalidated: true
        attribute :user_id, type: :string, on: [:create, :update]
      end
    end
  end
end
