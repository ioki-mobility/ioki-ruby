# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Task < Base
        attribute :earliest_completion_from, type: :string, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :version, on: [:read, :create], type: :integer
        attribute :acceptable, on: :read, type: :boolean
        attribute :accepted_at, on: :read, type: :date_time
        attribute :cancellable, on: :read, type: :boolean
        attribute :cancelled_at, on: :read, type: :date_time
        attribute :completable, on: :read, type: :boolean
        attribute :completed_at, on: :read, type: :date_time
        attribute :rejectable, on: :read, type: :boolean
        attribute :state, on: :read, type: :string
        attribute :waypoint_type, on: :read, type: :string
        attribute :calculated_point, on: :read, type: :object, class_name: 'CalculatedPoint'
        attribute :ride, on: :read, type: :object, class_name: 'Ride'
      end
    end
  end
end
