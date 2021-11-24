# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      def self.valid_models
        constants.
          select { |constant| const_get(constant).is_a?(Class) }.
          reject { |constant| const_get(constant).unvalidated? }.
          map { |model| const_get(model) } - [Base]
      end

      class Base < Ioki::Model::Base
        attribute :id,         on: :read, type: :string
        attribute :type,       on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
      end
    end
  end
end
