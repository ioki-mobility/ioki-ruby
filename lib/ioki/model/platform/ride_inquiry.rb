# frozen_string_literal: true

require 'ioki/model/platform/requested_point'
require 'ioki/model/platform/assistance'
require 'ioki/model/platform/availability'
require 'ioki/model/platform/constraints'
require 'ioki/model/platform/estimation'

module Ioki
  module Model
    module Platform
      class RideInquiry < Base
        attribute :origin, on: :create, type: :object, model_class: RequestedPoint, unvalidated: true # The model does not return it but it's used when sending data to the server.
        attribute :destination, on: :create, type: :object, model_class: RequestedPoint, unvalidated: true # The model does not return it but it's used when sending data to the server.
        attribute :assistances, on: :read, type: :array, model_class: Assistance
        attribute :availability, on: :read, type: :object, model_class: Availability
        attribute :constraints, on: :read, type: :object, model_class: Constraints
        attribute :errors, on: :read, type: :array
        attribute :estimations, on: :read, type: :array, model_class: Estimation
      end
    end
  end
end
