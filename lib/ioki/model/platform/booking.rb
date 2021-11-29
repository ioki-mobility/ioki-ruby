# frozen_string_literal: true

require 'ioki/model/platform/payment_method'

module Ioki
  module Model
    module Platform
      class Booking < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :id, :type, :created_at and :updated_at.

        unvalidated true

        attribute :verification_code, type: :string, on: [:read, :update]
        attribute :ride_version, type: :integer, on: :create
        attribute :payment_method, type: :object, on: :create, model_class: PaymentMethod
      end
    end
  end
end
