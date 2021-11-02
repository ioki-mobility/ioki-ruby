# frozen_string_literal: true

require 'ioki/model/platform/user'

module Ioki
  module Model
    module Platform
      class PassengerRequestToken < Base
        attribute :token, type: :string,  on: :read
        attribute :user,  type: :object,  on: :read, model_class: Ioki::Model::Platform::User
        attribute :client_identifier, type: :string, on: :create
      end
    end
  end
end
