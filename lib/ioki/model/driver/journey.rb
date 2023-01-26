# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Journey < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :version, on: :read, type: :integer
        attribute :legs, on: :read, type: :array, class_name: 'Leg'
      end
    end
  end
end
