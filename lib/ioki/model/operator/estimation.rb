# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Estimation < Base
        def self.schema_path
          'operator_api--v20210101--ride_inquiry--estimation'
        end

        attribute :type, on: :read, type: :string
        attribute :confidence, on: :read, type: :float
        attribute :dropoff, on: :read, type: :object, class_name: 'CalculatedPoint'
        attribute :estimation_type, on: :read, type: :string
        attribute :fare, on: :read, type: :object, class_name: 'Fare'
        attribute :links, on: :read, type: :array, class_name: 'RideInquiryLink'
        # Quote from the API docs: "Additional metadata about the estimation, no specified format (yet)"
        attribute :meta_data, on: :read, type: :object
        attribute :pickup, on: :read, type: :object, class_name: 'CalculatedPoint'
      end
    end
  end
end
