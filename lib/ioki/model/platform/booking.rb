# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Booking < Base
        attribute :verification_code, type: :string, on: [:read, :update]
        # The model does not return it but it's used when sending data to the server.
        attribute :ride_version, type: :integer, on: :create, unvalidated: true
        # The model does not return it but it's used when sending data to the server.
        attribute :payment_method, type: :object, on: :create, class_name: 'PaymentMethod', unvalidated: true
      end
    end
  end
end
