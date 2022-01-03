# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class RideInquiry < Base
        # The model does not return it but it's used when sending data to the server.
        attribute :origin,         type: :object,  on: :create, class_name: 'RequestedPoint', unvalidated: true
        # The model does not return it but it's used when sending data to the server.
        attribute :destination,    type: :object,  on: :create, class_name: 'RequestedPoint', unvalidated: true
        # The model does not return it but it's used when sending data to the server.
        attribute :product_id,     type: :string,  on: :create, unvalidated: true
        attribute :assistances, on: :read, type: :array, class_name: 'Assistance'
        attribute :availability, on: :read, type: :object, class_name: 'Availability'
        attribute :constraints, on: :read, type: :object, class_name: 'Constraints'
        attribute :errors, on: :read, type: :array
        attribute :estimations, on: :read, type: :array, class_name: 'Estimation'
      end
    end
  end
end
