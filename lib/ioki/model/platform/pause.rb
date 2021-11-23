# frozen_string_literal: true

require 'ioki/model/platform/place'

module Ioki
  module Model
    module Platform
      class Pause < Base
        attribute :actual_ends_at, on: :read, type: :date_time
        attribute :actual_starts_at, on: :read, type: :date_time
        attribute :place, on: :read, type: :object, model_class: Ioki::Model::Platform::Place
        attribute :planned_ends_at, on: :read, type: :date_time
        attribute :planned_starts_at, on: :read, type: :date_time
        attribute :preserve_duration, on: :read, type: :boolean
      end
    end
  end
end
