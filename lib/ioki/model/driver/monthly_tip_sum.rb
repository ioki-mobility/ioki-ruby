# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class MonthlyTipSum < Base
        attribute :type, on: :read, type: :string
        attribute :date, on: :read, type: :string
        attribute :amount, on: :read, type: :object, class_name: 'Money'
      end
    end
  end
end
