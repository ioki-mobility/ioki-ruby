# frozen_string_literal: true

require 'ioki/model/platform/payment_method'

module Ioki
  module Model
    module Platform
      class Booking < Base
        attribute :verification_code, type: :string, on: [:read, :update]
        attribute :ride_version, type: :integer, on: :create
        attribute :payment_method, type: :object, on: :create, model_class: Ioki::Model::Platform::PaymentMethod
      end
    end
  end
end
