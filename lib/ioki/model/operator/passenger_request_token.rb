# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class PassengerRequestToken < Base
        attribute :token, type: :string,  on: :read
        # The model does not return it but it's used when sending data to the server.
        attribute :user,  type: :object,  on: :read, class_name: 'User', unvalidated: true
        attribute :user_id, type: :string, on: [:create, :update]
        # The model does not return it but it's used when sending data to the server.
        attribute :client_identifier, type: :string, on: :create, unvalidated: true
      end
    end
  end
end
