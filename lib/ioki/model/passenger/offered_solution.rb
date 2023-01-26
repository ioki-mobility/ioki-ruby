# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class OfferedSolution < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :bookable, on: :read, type: :boolean
        attribute :solution_type, on: :read, type: :string
        attribute :fare, on: :read, type: :object, class_name: 'Fare'
        attribute :hops, on: :read, type: :array, class_name: 'Hop'
      end
    end
  end
end
