# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Pause < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :actual_ends_at, on: :read, type: :date_time
        attribute :actual_starts_at, on: :read, type: :date_time
        attribute :ends_at, on: :create, type: :date_time, unvalidated: true
        attribute :place, on: :read, type: :object, class_name: 'Place'
        attribute :place_id, on: :create, type: :string, unvalidated: true
        attribute :planned_ends_at, on: :read, type: :date_time
        attribute :planned_starts_at, on: :read, type: :date_time
        attribute :preserve_duration, on: [:read, :create], type: :boolean
        attribute :starts_at, on: :create, type: :date_time, unvalidated: true
      end
    end
  end
end
