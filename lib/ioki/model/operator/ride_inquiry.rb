# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RideInquiry < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        # The model does not return it but it's used when sending data to the server.
        attribute :origin, on: :create, type: :object, class_name: 'RequestedPoint', unvalidated: true
        # The model does not return it but it's used when sending data to the server.
        attribute :destination, on: :create, type: :object, class_name: 'RequestedPoint', unvalidated: true
        attribute :assistances, on: :read, type: :array, class_name: 'Assistance'
        attribute :availability, on: :read, type: :object, class_name: 'Availability'
        attribute :constraints, on: :read, type: :object, class_name: 'Constraints'
        attribute :errors, on: :read, type: :array
        attribute :estimations, on: :read, type: :array, class_name: 'Estimation'
      end
    end
  end
end
