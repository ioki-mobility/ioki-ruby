# frozen_string_literal: true

require 'ioki/model/platform/user'

module Ioki
  module Model
    module Platform
      class PassengerRequestToken < Base
        attribute :token, type: :string,  on: :read
        attribute :user,  type: :object,  on: :read, model_class: User, unvalidated: true # The model does not return it but it's used when sending data to the server.
        attribute :user_id, type: :string, on: [:create, :update]
        attribute :client_identifier, type: :string, on: :create, unvalidated: true # The model does not return it but it's used when sending data to the server.
      end
    end
  end
end
