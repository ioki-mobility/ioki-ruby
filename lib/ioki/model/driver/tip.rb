# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Tip < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :amount, on: :read, type: :object, class_name: 'Money'
        attribute :ride, on: :read, type: :object, class_name: 'Ride'
      end
    end
  end
end
