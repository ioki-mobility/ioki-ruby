# frozen_string_literal: true

require 'ioki/model/passenger/money'

module Ioki
  module Model
    module Passenger
      class Tipping < Ioki::Model::Base
        # Note that this does not inherit from Base because :created_at, :updated_at, :type and :id are not defined.

        def self.schema_path
          'passenger_api--product--tipping'
        end

        def self.specification_scope
          nil
        end

        attribute :minimum, on: :read, type: :object, model_class: Money
        attribute :suggestions, on: :read, type: :array, model_class: Money
      end
    end
  end
end
