# frozen_string_literal: true

require 'ioki/model/passenger/user_email'

module Ioki
  module Model
    module Passenger
      class User < Base
        attribute :email,             type: :object,    model_class: UserEmail,
on: [:read, :update]
        attribute :first_name,        type: :string,    on: [:read, :update]
        attribute :last_name,         type: :string,    on: [:read, :update]
        attribute :phone_number,      type: :string,    on: :read
        attribute :locale,            type: :string,    on: :read
      end
    end
  end
end
