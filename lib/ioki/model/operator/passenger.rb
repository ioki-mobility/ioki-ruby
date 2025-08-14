# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Passenger < Base
        def self.schema_path
          'operator_api--v20210101--passenger_schema'
        end

        attribute :type,
                  on:   :create,
                  type: :string

        attribute :options,
                  on:         :create,
                  type:       :array,
                  class_name: 'PassengerOption'

        attribute :first_name,
                  on:   :create,
                  type: :string

        attribute :last_name,
                  on:   :create,
                  type: :string
      end
    end
  end
end
