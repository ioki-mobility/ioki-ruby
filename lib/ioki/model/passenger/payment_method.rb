# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PaymentMethod < Base
        def self.schema_path
          'passenger_api--payment_method_schema'
        end

        attribute :type, on: :read, type: :string
        attribute :id, on: [:read, :create], type: :string, omit_if_blank_on: :create
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :payment_method_type, on: :create, type: :string
        attribute :attached, on: :read, type: :boolean
        attribute :summary, on: :read, type: :object, class_name: 'PaymentMethodSummary'

        attribute :details, on: :create, type: :object, class_name: 'PaymentMethodDetails', omit_if_blank_on: :create
      end
    end
  end
end
