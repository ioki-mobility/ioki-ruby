# frozen_string_literal: true

require 'ioki/model/passenger/assistance'
require 'ioki/model/passenger/availability'
require 'ioki/model/passenger/constraints'
require 'ioki/model/passenger/estimation'
require 'ioki/model/passenger/requested_point'

module Ioki
  module Model
    module Passenger
      class RideInquiry < Base
        attribute :origin,         type: :object,  on: :create, model_class: RequestedPoint, unvalidated: true # The model does not return it but it's used when sending data to the server.
        attribute :destination,    type: :object,  on: :create, model_class: RequestedPoint, unvalidated: true # The model does not return it but it's used when sending data to the server.
        attribute :assistances, on: :read, type: :array, model_class: Assistance
        attribute :availability, on: :read, type: :object, model_class: Availability
        attribute :constraints, on: :read, type: :object, model_class: Constraints
        attribute :errors, on: :read, type: :array
        attribute :estimations, on: :read, type: :array, model_class: Estimation
      end
    end
  end
end
