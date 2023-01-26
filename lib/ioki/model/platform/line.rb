# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Line < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :name, on: [:read, :create, :update], type: :string
        attribute :route_number, on: [:read, :create, :update], type: :string
        attribute :variant, on: [:read, :create, :update], type: :string
        attribute :skip_time_window_check, on: [:read, :create, :update], type: :boolean
        attribute :line_stops, type: :array, on: :read, class_name: 'LineStop'
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
