# frozen_string_literal: true

require 'ioki/model/platform/calculated_point'
require 'ioki/model/platform/pause'

module Ioki
  module Model
    module Platform
      class Task < Base
        attribute :acceptable, on: :read, type: :boolean
        attribute :accepted_at, on: :read, type: :string
        attribute :calculated_point, on: :read, type: :object, model_class: Ioki::Model::Platform::CalculatedPoint
        attribute :cancellable, on: :read, type: :boolean
        attribute :cancelled_at, on: :read, type: :string
        attribute :completable, on: :read, type: :boolean
        attribute :completed_at, on: :read, type: :string
        attribute :completer, on: :read, type: :object # The model_class is omitted because it can have one of several types.
        attribute :completer_id, on: :read, type: :string
        attribute :completer_type, on: :read, type: :string
        attribute :pause, on: :read, type: :object, model_class: Ioki::Model::Platform::Pause
        attribute :rejectable, on: :read, type: :boolean
        attribute :ride, on: :read, type: :object # The model_class is omitted because of a circular dependency
        attribute :state, on: :read, type: :string
        attribute :task_list_id, on: :read, type: :string
        attribute :waypoint_type, on: :read, type: :string
      end
    end
  end
end
