# frozen_string_literal: true

require 'ioki/model/platform/deactivation'
require 'ioki/model/platform/driver'
require 'ioki/model/platform/matching_configuration'
require 'ioki/model/platform/pause'
require 'ioki/model/platform/place'
require 'ioki/model/platform/task'
require 'ioki/model/platform/vehicle'

module Ioki
  module Model
    module Platform
      class TaskList < Base
        attribute :actual_ends_at, on: :read, type: :date_time
        attribute :actual_starts_at, on: :read, type: :date_time
        attribute :ad_hoc_bookable, on: :read, type: :boolean
        attribute :deactivated, on: :read, type: :boolean
        attribute :deactivations, on: :read, type: :array, model_class: Deactivation
        attribute :driver, on: :read, type: :object, model_class: Driver
        attribute :end_place, on: :read, type: :object, model_class: Place
        attribute :matching_configuration, on: :read, type: :object, model_class: MatchingConfiguration
        attribute :paused, on: :read, type: :boolean
        attribute :pauses, on: :read, type: :array, model_class: Pause
        attribute :planned_ends_at, on: :read, type: :date_time
        attribute :planned_starts_at, on: :read, type: :date_time
        attribute :prebookable, on: :read, type: :boolean
        attribute :product_id, on: :read, type: :string
        attribute :start_place, on: :read, type: :object, model_class: Place
        attribute :state, on: :read, type: :string
        attribute :tasks, on: :read, type: :array, model_class: Task
        attribute :vehicle, on: :read, type: :object, model_class: Vehicle
      end
    end
  end
end
