# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Pause < Base
        attribute :actual_ends_at, on: :read, type: :date_time
        attribute :actual_starts_at, on: :read, type: :date_time
        attribute :place, on: :read, type: :object, class_name: 'Place'
        attribute :planned_ends_at, on: :read, type: :date_time
        attribute :planned_starts_at, on: :read, type: :date_time
        attribute :preserve_duration, on: :read, type: :boolean

        attribute :ends_at, on: :create, type: :date_time
        attribute :starts_at, on: :create, type: :date_time
        attribute :place_id, on: :create, type: :object, class_name: 'Place'
      end
    end
  end
end
