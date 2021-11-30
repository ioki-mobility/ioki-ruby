# frozen_string_literal: true

require 'ioki/model/platform/payment_method'

module Ioki
  module Model
    module Platform
      class Booking < Base
        attribute :verification_code, type: :string, on: [:read, :update]
        attribute :ride_version, type: :integer, on: :create, unvalidated: true # The model does not return it but it's used when sending data to the server.
        attribute :payment_method, type: :object, on: :create, model_class: PaymentMethod, unvalidated: true # The model does not return it but it's used when sending data to the server.
      end
    end
  end
end
