# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class TipCreate < Base
        def self.schema_path
          'passenger_api--v1--tip_schema'
        end

        attribute :amount, on: :create, type: :integer
        attribute :payment_method, on: :create, type: :object, class_name: 'PaymentMethod'
        attribute :on_session, on: :create, type: :boolean, omit_if_nil_on: :create
        attribute :async, on: :create, type: :boolean, omit_if_nil_on: :create
      end
    end
  end
end
