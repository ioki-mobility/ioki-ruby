# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Line < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :name, on: [:read, :create, :update], type: :string
        attribute :mode, on: [:read, :create, :update], type: :string
        attribute :route_number, on: [:read, :create, :update], type: :string
        attribute :skip_time_window_check, on: [:read, :create, :update], type: :boolean
        attribute :slug, on: [:read, :create, :update], type: :string
        attribute :variant, on: [:read, :create, :update], type: :string
        attribute :line_stops, type: :array, on: :read, class_name: 'LineStop'
      end
    end
  end
end
