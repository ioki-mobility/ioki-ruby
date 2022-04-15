# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class RideInquiry < Base
        attribute :assistances, on: :read, type: :array, class_name: 'Assistance'
        attribute :availability, on: :read, type: :object, class_name: 'Availability'
        attribute :constraints, on: :read, type: :object, class_name: 'Constraints'
        attribute :destination, on: :create, type: :object, class_name: 'RequestedPoint', unvalidated: true
        attribute :errors, on: :read, type: :array
        attribute :estimations, on: :read, type: :array, class_name: 'Estimation'
        attribute :origin, on: :create, type: :object, class_name: 'RequestedPoint', unvalidated: true
      end
    end
  end
end
