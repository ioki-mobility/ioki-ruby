# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Journey < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :legs, type: :array, on: :read, class_name: 'Leg'
        attribute :version, type: :integer, on: :read
      end
    end
  end
end
