# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class MonthlyTipSum < Base
        def self.schema_path
          'driver_api--v2--tip_sum'
        end

        attribute :type, on: :read, type: :string
        attribute :date, on: :read, type: :string
        attribute :amount, on: :read, type: :object, class_name: 'Money'
      end
    end
  end
end
