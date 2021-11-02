# frozen_string_literal: true

require 'ioki/model/passenger/client'
require 'ioki/model/passenger/product'
require 'ioki/model/passenger/provider'
require 'ioki/model/passenger/ride'
require 'ioki/model/passenger/user'

module Ioki
  module Model
    module Passenger
      class Bootstrap < Base
        attribute :client, type: :object, on: :read, model_class: Ioki::Model::Passenger::Client
        attribute :products, type: :array, on: :read, model_class: Ioki::Model::Passenger::Product
        attribute :provider, type: :object, on: :read, model_class: Ioki::Model::Passenger::Provider
        attribute :rides_with_failed_payments, type: :array, on: :read, model_class: Ioki::Model::Passenger::Ride
        attribute :user, type: :object, on: :read, model_class: Ioki::Model::Passenger::User
      end
    end
  end
end
