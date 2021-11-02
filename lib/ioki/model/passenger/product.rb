# frozen_string_literal: true

require 'ioki/model/passenger/provider'

module Ioki
  module Model
    module Passenger
      class Product < Base
        attribute :name, on: :read
        attribute :provider, type: :object, on: :read, model_class: Ioki::Model::Passenger::Provider
      end
    end
  end
end
